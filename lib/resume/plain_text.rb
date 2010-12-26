module Resume
  class PlainTextBackend
    class << self
      RN = "\r\n"
      def render r
        result = ""

        # Name
        result << r.about[:name].upcase << RN << RN

        # Adress
        result << r.about[:address].join(RN) << RN
        result << r.about[:email] << RN
        result << r.about[:phone] << RN << RN

        # Education
        result << "EDUCATION" << RN << RN
        r.schools.each do |ed|
          result << ed[:school] << ", " << ed[:city] << RN
          result << ed[:degree] << ", " if ed[:degree]
          result << (ed[:will_finish] ? "expected graduation: #{ed[:will_finish]}" :
                     ed[:finished]) << RN << RN
        end

        # Jobs
        result << "WORK EXPERIENCE" << RN << RN
        r.jobs.each do |job|
          date = job[:date] ? "(#{job[:date]})" : ""
          result << job[:position] << ", " << job[:employer] << date << RN
          result << "  " << job[:description] << RN << RN
        end

        # Sections
        r.sections.each do |sec|
          result << sec[:name].upcase << RN << RN
          if sec[:text]
            result << sec[:text] << RN
          end
          if sec[:bullets]
            sec[:bullets].each do |b|
              result << " - " << b << RN
            end
          end
          result << RN
        end

        result
      end
    end
  end
end
