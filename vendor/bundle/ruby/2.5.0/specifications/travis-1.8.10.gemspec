# -*- encoding: utf-8 -*-
# stub: travis 1.8.10 ruby lib

Gem::Specification.new do |s|
  s.name = "travis".freeze
  s.version = "1.8.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Konstantin Haase".freeze, "Hiro Asari".freeze, "Sarah Hodne".freeze, "joshua-anderson".freeze, "Aaron Hill".freeze, "Buck Doyle".freeze, "Peter Souter".freeze, "Christopher Grim".freeze, "Joe Corcoran".freeze, "Peter van Dijk".freeze, "Aakriti Gupta".freeze, "Max Barnash".freeze, "Ren\u00E9e Hendricksen".freeze, "carlad".freeze, "Ke Zhu".freeze, "Carlos Palhares".freeze, "Dan Buch".freeze, "Mar\u00EDa de Ant\u00F3n".freeze, "Mathias Meyer".freeze, "mariadeanton".freeze, "Tobias Bieniek".freeze, "Andreas Tiefenthaler".freeze, "Corinna Wiesner".freeze, "David Rodr\u00EDguez".freeze, "Stefan Nordhausen".freeze, "Igor Wiedler".freeze, "Thais Camilo and Konstantin Haase".freeze, "Joep van Delft".freeze, "Jonne Ha\u00DF".freeze, "Josh Kalderimis".freeze, "Julia S.Simon".freeze, "Justin Lambert".freeze, "Daniel Chatfield".freeze, "Laurent Petit".freeze, "Maarten van Vliet".freeze, "Mario Visic".freeze, "john muhl".freeze, "Adam Lavin".freeze, "Matteo Sumberaz".freeze, "Matthias Bussonnier".freeze, "Michael Mior".freeze, "Michael S. Fischer".freeze, "Miro Hron\u010Dok".freeze, "Neamar".freeze, "Nero Leung".freeze, "Nicolas Bessi (nbessi)".freeze, "Peter Bengtsson".freeze, "Benjamin Manns".freeze, "Basarat Ali Syed".freeze, "Piotr Sarnacki".freeze, "Rapha\u00EBl Pinson".freeze, "Rob Hoelz".freeze, "Robert Van Voorhees".freeze, "Sven Fuchs".freeze, "Tobias Wilken".freeze, "Zachary Gershman".freeze, "Zachary Scott".freeze, "Adrien Brault".freeze, "jeffdh".freeze, "Harald Nordgren".freeze, "HaraldNordgren".freeze, "Eric Herot".freeze, "George Millo".freeze, "Igor".freeze, "Jacob Atzen".freeze, "Jacob Burkhart".freeze, "Dominic Jodoin".freeze, "Joe Rafaniello".freeze, "Jon-Erik Schneiderhan".freeze, "Jonas Chromik".freeze]
  s.date = "2019-05-08"
  s.description = "CLI and Ruby client library for Travis CI".freeze
  s.email = ["konstantin.mailinglists@googlemail.com".freeze, "asari.ruby@gmail.com".freeze, "j@zatigo.com".freeze, "aa1ronham@gmail.com".freeze, "b@chromatin.ca".freeze, "p.morsou@gmail.com".freeze, "chrisg@luminal.io".freeze, "joe@corcoran.io".freeze, "peter.van.dijk@netherlabs.nl".freeze, "kzhu@us.ibm.com".freeze, "renee@travis-ci.org".freeze, "i.am@anhero.ru".freeze, "mariadeanton@gmail.com".freeze, "aakritigupta@users.noreply.github.com".freeze, "me@xjunior.me".freeze, "dan@meatballhat.com".freeze, "mariadeanton@gmail.com".freeze, "meyer@paperplanes.de".freeze, "carlad@users.noreply.github.com".freeze, "igor@travis-ci.org".freeze, "deivid.rodriguez@gmail.com".freeze, "stefan.nordhausen@immobilienscout24.de".freeze, "aakriti@travis-ci.org".freeze, "wiesner@avarteq.de".freeze, "dev+narwen+rkh@rkh.im".freeze, "tobias.bieniek@gmail.com".freeze, "at@an-ti.eu".freeze, "jon-erik.schneiderhan@meyouhealth.com".freeze, "Jonas.Chromik@student.hpi.uni-potsdam.de".freeze, "me@jhass.eu".freeze, "josh.kalderimis@gmail.com".freeze, "julia.simon@biicode.com".freeze, "jlambert@eml.cc".freeze, "chatfielddaniel@gmail.com".freeze, "laurent.petit@gmail.com".freeze, "maartenvanvliet@gmail.com".freeze, "mario@mariovisic.com".freeze, "git@johnmuhl.com".freeze, "adam@lavoaster.co.uk".freeze, "gnappoms@gmail.com".freeze, "bussonniermatthias@gmail.com".freeze, "benmanns@gmail.com".freeze, "mmior@uwaterloo.ca".freeze, "mfischer@zendesk.com".freeze, "miro@hroncok.cz".freeze, "neamar@neamar.fr".freeze, "neroleung@gmail.com".freeze, "nbessi@users.noreply.github.com".freeze, "peterbe@mozilla.com".freeze, "basaratali@gmail.com".freeze, "drogus@gmail.com".freeze, "raphael.pinson@camptocamp.com".freeze, "adrien.brault@gmail.com".freeze, "rob@hoelz.ro".freeze, "rcvanvo@gmail.com".freeze, "me@svenfuchs.com".freeze, "tw@cloudcontrol.de".freeze, "pair+zg@pivotallabs.com".freeze, "e@zzak.io".freeze, "carla@travis-ci.org".freeze, "jeffdh@gmail.com".freeze, "haraldnordgren@gmail.com".freeze, "haraldnordgren@gmail.com".freeze, "eric.github@herot.com".freeze, "georgejulianmillo@gmail.com".freeze, "dominic@travis-ci.com".freeze, "igorwwwwwwwwwwwwwwwwwwww@users.noreply.github.com".freeze, "jatzen@gmail.com".freeze, "jburkhart@engineyard.com".freeze, "jrafanie@users.noreply.github.com".freeze, "joep@travis-ci.org".freeze, "joepvd@users.noreply.github.com".freeze]
  s.executables = ["travis".freeze]
  s.files = ["bin/travis".freeze]
  s.homepage = "https://github.com/travis-ci/travis.rb".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Travis CI client".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, ["~> 0.9", ">= 0.9.1"])
      s.add_runtime_dependency(%q<highline>.freeze, ["~> 1.6"])
      s.add_runtime_dependency(%q<backports>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<gh>.freeze, ["~> 0.13"])
      s.add_runtime_dependency(%q<launchy>.freeze, ["~> 2.1"])
      s.add_runtime_dependency(%q<typhoeus>.freeze, ["~> 0.6", ">= 0.6.8"])
      s.add_runtime_dependency(%q<pusher-client>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.12"])
      s.add_development_dependency(%q<sinatra>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rack-test>.freeze, ["~> 0.6"])
    else
      s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.9", ">= 0.9.1"])
      s.add_dependency(%q<highline>.freeze, ["~> 1.6"])
      s.add_dependency(%q<backports>.freeze, [">= 0"])
      s.add_dependency(%q<gh>.freeze, ["~> 0.13"])
      s.add_dependency(%q<launchy>.freeze, ["~> 2.1"])
      s.add_dependency(%q<typhoeus>.freeze, ["~> 0.6", ">= 0.6.8"])
      s.add_dependency(%q<pusher-client>.freeze, ["~> 0.4"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.12"])
      s.add_dependency(%q<sinatra>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rack-test>.freeze, ["~> 0.6"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
    s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.9", ">= 0.9.1"])
    s.add_dependency(%q<highline>.freeze, ["~> 1.6"])
    s.add_dependency(%q<backports>.freeze, [">= 0"])
    s.add_dependency(%q<gh>.freeze, ["~> 0.13"])
    s.add_dependency(%q<launchy>.freeze, ["~> 2.1"])
    s.add_dependency(%q<typhoeus>.freeze, ["~> 0.6", ">= 0.6.8"])
    s.add_dependency(%q<pusher-client>.freeze, ["~> 0.4"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.12"])
    s.add_dependency(%q<sinatra>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rack-test>.freeze, ["~> 0.6"])
  end
end
