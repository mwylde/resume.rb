module Resume  
  class LatexBackend
    class << self
      ESCAPING_RULES = {
        "&" => '\&',
#       "TeX" => '\TeX',
        "LaTeX" => '\LaTeX',
        "$" => '\textdollar',
        "#" => '\#',
        "%" => '\%',
        "^" => '\^',
        "_" => '\_',
        "{" => '\{',
        "}" => '\}',
        "<" => '\textless',
        ">" => '\textgreater',
        "~" => '\textasciitilde'
      }

      # Returns a LaTeX document for the supplied resume and options
      # @param [resume]  The resume information
      # @param [Hash] options Options
      # @return [String] A LaTeX document
      def render resume
        context = {:resume_class => File.dirname(__FILE__) + "/templates/resume"}

        vars = [:about, :schools, :jobs, :sections]
        vars.each do |name|
          var = nil
          if values = resume.send(name)
            if values.is_a? Array
              var = []
              values.each do |a|
                var << {}
                a.each do |k, v|
                  var[-1][k] = escape v
                end
              end
            else
              var = {}
              values.each do |k, v|
                var[k] = escape v
              end
            end
            context[name] = var
          end
        end
        template = File.open(File.dirname(__FILE__) + "/templates/latex.tex.erb").read

        Erubis::Eruby.new(template).evaluate(context)
      end

      private
      def escape s
        ESCAPING_RULES.each do |from, to|
          if s.is_a? Array
            s = s.map{|x| x.gsub(from, to)}
          else
            s = s.gsub(from, to)
          end
        end
        s
      end

      class BindingObject
        attr_accessor :about, :schools, :jobs, :sections
        def get_binding; binding; end
      end
    end
  end
end
