require 'spec_helper'

describe 'ToJsOnInBatches' do
  before :all do
    ActiveRecord::Base.include_root_in_json = false
    10.times do |i|
      Tested.create some_data: "Some data #{i}";
    end
  end

  specify { Tested.count.should be == 10 }

  context "#to_json_in_batches" do
    let(:scope) { Tested.scoped }
    let(:batch_size) { 2 }
    let(:stream) { StringIO.new }

    context "Result" do
      before do
        scope.to_json_in_batches stream, {}, batch_size: batch_size
        stream.seek 0
      end

      it "returns correct data" do
        stream.read.should be == "[{\"id\":1,\"some_data\":\"Some data 0\"},{\"id\":2,\"some_data\":\"Some data 1\"},{\"id\":3,\"some_data\":\"Some data 2\"},{\"id\":4,\"some_data\":\"Some data 3\"},{\"id\":5,\"some_data\":\"Some data 4\"},{\"id\":6,\"some_data\":\"Some data 5\"},{\"id\":7,\"some_data\":\"Some data 6\"},{\"id\":8,\"some_data\":\"Some data 7\"},{\"id\":9,\"some_data\":\"Some data 8\"},{\"id\":10,\"some_data\":\"Some data 9\"}]"
      end
    end

    context "Batch logic" do
      specify do
        scope.should_receive(:group_to_json).exactly(5).times

        scope.to_json_in_batches stream, {}, batch_size: batch_size
      end
    end
  end

  context "#group_to_json" do
    let(:scope) { Tested.scoped }
    let(:item_1) { Tested.find(1) }
    let(:item_2) { Tested.find(2) }
    let(:item_3) { Tested.find(3) }

    let(:json_options) { Hash[only: :some_data] }

    subject { scope.group_to_json [item_1, item_2, item_3], json_options }

    specify { subject.should be == "{\"some_data\":\"Some data 0\"},{\"some_data\":\"Some data 1\"},{\"some_data\":\"Some data 2\"}" }
  end
end
