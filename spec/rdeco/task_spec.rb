# spec/rdeco/task_spec.rb
require "rdeco/task"

RSpec.describe Rdeco::Task do
  class YourClass
    include Rdeco::Task

    before :setup, :preparation, :setup_other
    main :core_logic
    after :teardown, :cleanup

    def setup
      puts "Setting up..."
    end

    def preparation
      puts "Doing some preparation..."
    end

    def setup_other
      puts "Setting up other things..."
    end

    def core_logic
      puts "Executing core logic..."
    end

    def teardown
      puts "Tearing down..."
    end

    def cleanup
      puts "Cleaning up..."
    end
  end

  let(:instance) { YourClass.new }

  describe ".run" do
    it "executes the tasks in the correct order" do
      expect(instance).to receive(:setup).ordered
      expect(instance).to receive(:preparation).ordered
      expect(instance).to receive(:setup_other).ordered
      expect(instance).to receive(:core_logic).ordered
      expect(instance).to receive(:teardown).ordered
      expect(instance).to receive(:cleanup).ordered

      YourClass.run(instance)
    end
  end
end
