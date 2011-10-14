module Resume
  class MarkdownBackend
    class << self
      RN = "\r\n"
      def render r
        result = ""
        result << "# " <<  r.about[:name] << RN << RN
        result << " * " << r.about[:address].join(", ") << RN if r.about[:address]
        result << " * " << r.about[:email] << RN if r.about[:email]
        result << " * " << r.about[:phone] << RN if r.about[:phone]
        result << " * " << r.about[:url] << RN if r.about[:url]
        result << RN

        result << "## Education" << RN << RN
        r.schools.each do |ed|
          result << ed[:school] << ", " << ed[:city] << "  " << RN if ed[:school]
          result << ed[:degree] << ", " if ed[:degree]
          result << (ed[:will_finish] ? "expected graduation: #{ed[:will_finish]}" :
                     ed[:finished]) << RN << RN
        end

        result << "## Work Experience" << RN << RN
        r.jobs.each do |job|
          date = job[:date] ? " (#{job[:date]})" : ""
          result << "### " <<  job[:position] << ", "
          result << job[:employer] << date << RN << RN
          result << job[:description] << RN << RN
        end

        # Sections
        r.sections.each do |sec|
          result << "## " << sec[:name] << RN << RN
          if sec[:text]
            result << sec[:text] << RN
          end
          if sec[:bullets]
            sec[:bullets].each do |b|
              result << " * " << b << RN
            end
          end
          result << RN
        end

        result
      end
    end
  end
end
