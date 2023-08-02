module Rdeco
  module Task
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def before(*method_names)
        (@before_tasks ||= []).concat(method_names)
      end

      def main(method_name)
        @main_task = method_name
      end

      def after(*method_names)
        (@after_tasks ||= []).concat(method_names)
      end

      def run(instance)
        execute_before_tasks(instance)
        execute_main_task(instance)
        execute_after_tasks(instance)
      end

      private

      def execute_before_tasks(instance)
        return unless @before_tasks

        @before_tasks.each do |task|
          instance.send(task)
        end
      end

      def execute_main_task(instance)
        raise "No main task defined!" unless @main_task

        instance.send(@main_task)
      end

      def execute_after_tasks(instance)
        return unless @after_tasks

        @after_tasks.each do |task|
          instance.send(task)
        end
      end
    end
  end
end