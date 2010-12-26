libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'erubis'
require 'resume/latex'
require 'resume/plain_text'

# Ruby class that lets you define resumes that can be rendered
# to various backends. Currently planned is Markdown and LaTex,
# which give HTML and PDF when compiled with their respective
# tools.
#
module Resume
  class Resume
    attr_reader :about, :schools, :jobs, :sections
    # Starts a resume definition block
    def initialize &block
      rh = ResumeHandler.new
      block.arity < 1 ? rh.instance_eval(&block) : block.call(rh)
      @about = rh.about
      @schools = rh.schools
      @jobs = rh.jobs
      @sections = rh.sections
    end

    private
    # @private
    class ResumeHandler      
      attr_reader :about, :schools, :jobs, :sections

      def initialize
        @about = {}
        @schools = []
        @jobs = []
        @sections = []

        [:name, :email, :address, :url, :phone].each do |field|
          self.class.class_eval do
            define_method field do |value|
              @about[field] = value
            end
          end
        end
      end

      def education &block
        sh = sub_handler [:school, :finished, :will_finish, :degree, :city]
        block.arity < 1 ? sh.instance_eval(&block) : block.call(sh)
        @schools << sh.data
      end

      def job &block
        sh = sub_handler [:position, :employer, :city, :date, :description]
        block.arity < 1 ? sh.instance_eval(&block) : block.call(sh)
        @jobs << sh.data
      end

      def section &block
        sh = sub_handler [:name, :text, :bullets]
        block.arity < 1 ? sh.instance_eval(&block) : block.call(sh)
        @sections << sh.data
      end

      private
      # @private
      def sub_handler fields
        s = Class.new
        s.class_eval do
          attr_reader :data
          def initialize; @data = {}; end
          fields.each do |field|
            define_method field do |value|
              @data[field] = value
            end
          end
        end
        s.new
      end
    end
  end
end
