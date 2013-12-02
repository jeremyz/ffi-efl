# ffi-efl
    by Jérémy Zurcher
    http://asynk.ch
[![Gem Version](https://badge.fury.io/rb/ffi-efl.png)](http://badge.fury.io/rb/ffi-efl)

## DESCRIPTION:

A ruby ffi binding to [EFL](http://www.enlightenment.org/p.php?p=docs&l=en) libraries (Enlightenment Foundation Libraries).

## FEATURES/PROBLEMS:

* support ruby 2.0.0, 1.9.x NOT 1.8.x
* support EFL 1.8.x
* binding is almost complete but lacks high level ruby code and tests
* eldbus is not present yet
* only works with legacy API (--with-api=legacy or --with-api=both)

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

* [test/](https://github.com/jeremyz/ffi-efl/tree/master/test) and [spec/](https://github.com/jeremyz/ffi-efl/tree/master/spec) subdirs

## REQUIREMENTS:

* You need a sane EFL installation built with legacy API, goto [download](http://enlightenment.org/p.php?p=download&l=en) for more info.

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

* http://git.enlightenment.org/bindings/ruby/ffi-efl.git/
* https://github.com/jeremyz/ffi-efl
* http://cgit.asynk.ch/ffi-efl/

Gem:

* https://rubygems.org/gems/ffi-efl

## CREDITS:

Special thanks to:

* Lionel Orry
* Marius Hanne
* The EFL team

## LICENSE:

[MIT](http://www.opensource.org/licenses/MIT) see [MIT_LICENSE](https://github.com/jeremyz/ffi-efl/blob/master/MIT-LICENSE)
