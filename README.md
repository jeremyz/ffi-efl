# ffi-efl
    by Jérémy Zurcher
    http://asynk.ch

## DESCRIPTION:

A ruby ffi binding to [efl](http://www.enlightenment.org/p.php?p=docs&l=en) libraries (Enlightenment Foundation Libraries).

## FEATURES/PROBLEMS:

* pretty young project ...
* binding is complete but lacks high level ruby code and tests

## SYNOPSIS:

    require 'efl/elm/elm_win'
    require 'efl/elm/elm_bg'
    require 'efl/elm/elm_label'

    include Efl

    class MyWin < Elm::ElmWin
        def initialize name, title, &block
            super FFI::MemoryPointer::NULL, name, &block
            title_set title
            feed
            smart_callback_add "delete,request", method(:on_delete), FFI::MemoryPointer.from_string("my data")
        end
        def feed
            @bg = Elm::ElmBg.new(self) do
                size_hint_weight_expand
                evas_object_color_set 150,180,100,180
                show
            end
            resize_object_add @bg
            @lb = Elm::ElmLabel.new(self) do
                text_set "Hello World!"
                size_hint_align_fill
                size_hint_weight_expand
                show
            end
            resize_object_add @lb
        end
        def on_delete data, evas_object, event_info
            puts "EXIT #{data.read_string}"
            Elm.exit
        end
    end

    Elm.init

    win = MyWin.new "App name", "Window Title" do
        alpha_set true
        resize 200, 100
        center_set 600, 300
        show
    end

    Elm.run
    Elm.shutdown

For more examples you may look at:

* the [test/](https://github.com/jeremyz/ffi-efl/tree/master/test) and [spec/](https://github.com/jeremyz/ffi-efl/tree/master/spec) subdirs

## REQUIREMENTS:

* You need a sane enlightenment foundation libraries installation,
  for this you might like to use [build_efl_stable.sh](https://github.com/jeremyz/bin/blob/master/build_efl_stable.sh).
  or the heavy metal [easy_e17.sh](http://omicron.homeip.net/projects/#easy_e17.sh),
  or my git aware fork [easy_e17.sh](https://github.com/jeremyz/bin/blob/master/easy_e17.sh).

## DOWNLOAD/INSTALL:

From rubygems:

  [sudo] gem install ffi-efl

or from the git repository on github:

  git clone git://github.com/jeremyz/ffi-efl.git
  cd ffi-efl
  rake install

## RESOURCES:

You can find this project in a few places:

Online repositories:

* https://github.com/jeremyz/ffi-efl
* http://cgit.asynk.ch/ffi-efl/

Gem:

* https://rubygems.org/gems/ffi-efl

## CREDITS:

Special thanks to:

* Lionel Orry
* The enlightenment team

## LICENSE:

[MIT](http://www.opensource.org/licenses/MIT) see [MIT_LICENSE](https://github.com/jeremyz/ffi-efl/blob/master/MIT-LICENSE)
