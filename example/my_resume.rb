# -*- coding: utf-8 -*-
require 'resume'
require 'tempfile'
require 'date'

resume = Resume::Resume.new do |r|
  r.name "Micah Wylde"
  r.email "mwylde@wesleyan.edu"
  r.address ["Wesleyan University",
             "45 Wyllys Ave. #93026",
             "Middletown, CT 06459"]
  r.url "http://www.micahw.com/"
  r.phone "(xxx) xxx-xxxx"

  r.education do |ed|
    ed.school "Wesleyan University"
    ed.will_finish "May 2012"
    ed.degree "B.A. in Computer Science"
    ed.city "Middletown, CT"
  end

  r.education do |ed|
    ed.school "Georgiana Bruce Kirby"
    ed.finished "June 2008"
    ed.degree "H.S."
    ed.city "Santa Cruz, CA"
  end

  r.job do |j|
    j.position "Researcher"
    j.employer "Washington University CS Department REU"
    j.city "St. Louis, MO"
    j.date "Summer 2010"
    j.description "Designed and evaluated real-time scheduling algorithms for utility-aware non-preemtable, stochastic task sets using machine learning in C++. Worked under Dr. Chris Gill."
  end

  r.job do |j|
    j.position "Programming manager"
    j.employer "Instructional Media Services, Wesleyan University"
    j.city "Middletown, CT"
    j.date "2008-present"
    j.description "Maintained classroom multimedia technology and academic computing labs. Programmed and designed AMX-based integrated controllers and touch panels. Implemented a touchscreen-based classroomcontrol system in ruby and javascript. Managed other student programmers."
  end

  r.job do |j|
    j.position "Crew chief"
    j.employer "Center for the Arts, Wesleyan University"
    j.city "Middletown, CT"
    j.date "2008-present"
    j.description "Live mixing for shows in Wesleyan's Crowell Concert and World Music halls. Managed other student sound techs."
  end

  r.job do |j|
    j.position "Research assistant"
    j.employer "Space Science, NASA Ames Research Center"
    j.city "Moffet Field, CA"
    j.date "Summer 2007"
    j.description "Created theoretical models of interference, noise and compression artifacts in Cassini CIRS (Composite Infrared Spectrometer) data and wrote software to try to eliminate them, using IDL. Worked under Dr. Jeffrey Cuzzi of NASA Ames."
  end

  r.job do |j|
    j.position "Web developer"
    j.employer "Georgiana Bruce Kirby Preparatory School"
    j.city "Santa Cruz, CA"
    j.date "2007-2008"
    j.description "Redesigned the school's website using CSS and XHTML using a custom Ruby on Rails content management system designed such that non-proficient computer users could maintain and update the site. Additionally, integrated with the Schoolweb student portal (see software projects, below)."
  end

  r.section do |s|
    s.name "Skills"
    s.bullets ["Ruby, Javascript, Haskell, Lisp, C, C++, Python, Java, PHP, HTML, CSS, LaTeX",
               "Linux, OS X, Windows"]
  end
  
  r.section do |s|
    s.name "Software Projects"
    s.bullets ["Roomtrol (Ruby, Javascript, HTML5): Designed and built a classroom automation and control system with a Ruby backend and an HTML5 touchscreen interface written with Sproutcore and Node.js. Created a domain-specific language for writing drivers for classroom devices like projectors and video switchers. Allows professors to control multi-media equipment easily while improving remote support and monitoring. Currently in use at Wesleyan University (2009-present).",
               "Schoolweb (Ruby, Javascript, XHTML, SQL): Wrote a Ruby on Rails based portal designed to ease communication between students, faculty, and parents at high schools. Features include user customizable widgets which can include polls, html, file uploads, and other information  and a calendar customized to users’ clubs, courses, and grade. Integrates with school’s grading system, to allow for quick access to students’ grades. Allows teachers to input homework for viewing by students and parents. In use at Georgiana Bruce Kirby from 2007 to the present (2006-2008)."]
  end

  r.section do |s|
    s.name "Research Interests"
    s.bullets ["AI, crowd simulation, robot navigation, machine learning, real-time scheduling."]
  end

end


dir = File.dirname(Tempfile.new("resume").path)
path = dir + "/resume.#{Date.today.strftime("%Y.%m.%d")}"

File.open("#{path}.tex", "w+") do |f|
  f.write Resume::LatexBackend.render resume
end

system %Q$pdflatex -output-directory #{dir}  #{path}.tex && mv #{path}.pdf .$
