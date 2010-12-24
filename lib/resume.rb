# Ruby class that lets you define resumes that can be rendered
# to various backends. Currently planned is Markdown and LaTex,
# which give HTML and PDF when compiled with their respective
# tools.
#
module Resume
  class Resume
    # @private
    class ResumeHandler      
      attr_reader :about
      attr_reader :education
      attr_reader :jobs
      attr_reader :sections
      def initialize
        @about = {}
        @education = []
        @jobs = []
        @sections = []

        [:name, :email, :address, :url, :phone].each do |field|
          define_method field do |value, *options|
            @about[field] = { :value => value, :options => options }
          end
        end
      end

      def education &block
        sh = SubHandler.new [:school, :finished, :degree, :gpa, :major_gpa, :city]
        block.arity < 1 ? sh.instance_eval(&block) : block.call(sh)
        @education << sh.data
      end

      def jobs &block
        sh = SubHandler.new [:position, :employer, :city, :data, :description]
        block.arity < 1 ? sh.instance_eval(&block) : block.call(sh)
        @jobs << sh.data
      end

      def sections &block
        sh = SubHandler.new [:name, :text, :bullets]
        block.arity < 1 ? sh.instance_eval(&block) : block.call(sh)
        @sections << sh.data
      end
    end

    # @private
    def SubHandler
      attr_reader :data
      def initialize fields
        @data = {}
        fields.each do |field|
          define_method field do |value, *options|
            @data[field] = { :value => value, :options => options }
          end
        end
      end

      def method_missing name, args
        @data[name] = {:value => args[0], :options => args[1]}
      end
    end

    # Starts a resume definition block
    def define &block
      rh = ResumeHandler.new
      block.arity < 1 ? rh.instance_eval(&block) : block.call(rh)
      @about = rh.about
      @education = rh.education
      @jobs = rh.jobs
      @sections = rh.sections
    end

    
  end
end
