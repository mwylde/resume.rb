# -*- coding: utf-8 -*-
require 'resume'

resume = Resume::Resume.new do |r|
  r.name "Micah Wylde"
  r.email "mwylde@wesleyan.edu"
  r.address ["Wesleyan University",
             "45 Wyllys Ave. #93026",
             "Middletown, CT 06459"]
  r.url "http://micahw.com/"
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
    ed.city "Santa Cruz, CA"
  end

  r.job do |j|
    j.position "Researcher"
    j.employer "Washington University CS Dept. REU"
    j.city "St. Louis, MO"
    j.date "Summer 2010"
    j.description "Designed and evaluated real-time scheduling algorithms for utility-aware " +
      "non-preemtable, stochastic task sets using machine learning techniques in C++. Worked " +
      "under Dr. Chris Gill."
  end

  r.job do |j|
    j.position "Programming manager"
    j.employer "Instructional Media Services, Wesleyan University"
    j.city "Middletown, CT"
    j.date "2008-present"
    j.description "Maintained classroom multimedia technology and academic computing labs. Programmed and designed AMX-based integrated controllers and touch panels. Implemented a touchscreen-based classroomcontrol system in ruby and javascript."
  end

  r.job do |j|
    j.position "Crew Chief"
    j.employer "Center for the Arts, Wesleyan University"
    j.city "Middletown, CT"
    j.date "2008-present"
    j.description "Live mixing for shows in Wesleyan's Crowell Concert and World Music halls. Managed other student sound techs."
  end

  r.job do |j|
    j.position "Researcher"
    j.employer "Space Science, NASA Ames Research Center"
    j.city "Moffet Field, CA"
    j.date "Summer 2007"
    j.description "Created theoretical models for interference, noise and compression artifacts in Cassini CIRS (Composite Infrared Spectrometer) data, and wrote software to try to eliminate them, using IDL. Worked under Dr. Jeffrey Cuzzi of NASA Ames."
  end

  r.job do |j|
    j.position "Web Developer"
    j.employer "Georgiana Bruce Kirby Preparatory School"
    j.city "Santa Cruz, CA"
    j.date "2007-2008"
    j.description "Redesigned the school’s website using CSS and XHTML, built on a heavily-modified RubyOnRails content management system, with an administrative side designed such that non-proficient computer users could maintain and update the site. Additionally, integrated with the Schoolweb student portal."
  end

  r.section do |s|
    s.name "Skills"
    s.bullets ["Ruby, Javascript, Haskell, Lisp, C, C++, Python, Java, PHP, LaTeX",
               "Linux, OS X, Windows"]
  end

  r.section do |s|
    s.name "Research"
    s.bullets ["AI, crowd simulation, robot navigation, machine learning, real-time scheduling."]
  end
  
  r.section do |s|
    s.name "Software Projects"
    s.bullets ["Roomtrol (Ruby, Javascript, HTML5): classroom automation and control system with a ruby backend and HTML5 touchscreen interface built with Sproutcore and Node.js. Allows professors to control all multi-media equipment easily, while improving remote support and monitoring. Currently in use at Wesleyan University.",
               "Schoolweb (Ruby, Javascript, XHTML, SQL): RubyOnRails based portal designed to ease communication be- tween students, faculty, and parents at high schools. Features include user customizable “widgets” which can have polls, html, file uploads, or information about sports teams or theater produ
ctions and a calendar customized to users’ clubs, courses, and grade. Integrates with school’s grading system, to allow for quick access to students’ grades. Allows for teachers to input homework for viewing by students and parents. In use at Georgiana Bruce Kirby from 2007 to the present."]
  end
end

puts Resume::LatexBackend.render resume
