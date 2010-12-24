module Resume
  class LatexBackend
    ESCAPING_RULES = {
      "&" => '\&',
      "LaTeX" => '\LaTeX{}',
      "TeX" => '\TeX{}',
      "$" => '\textdollar{}'
    }

    # Returns a LaTeX document for the supplied resume and options
    # @param [resume]  The resume information
    # @param [Hash] options Options
    # @return [String] A LaTeX document
    def render resume
      template = File.open("../templates/latex.tex.erb")
      
    end
  end
end
