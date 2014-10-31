# TextEthan #

Clone of [TextEthan](http://www.textethan.com/) app - a messaging app that allows anyone to message you, written in Swift.

## Installation

Clone the repository

```
$ git clone https://github.com/thii/TextEthan.git
$ cd TextEthan
$ cp TextEthan/Resources/Other-Sources/AppToken.sample.plist TextEthan/Resources/Other-Sources/AppToken.plist
$ open TextEthan.xcworkspace
```

Sign up for a free app token on [SupportKit.io](https://app.supportkit.io)

Copy and paste the app token into the value of `AppToken` key in AppToken.plist file in the TextEthan project. You'll want to replace the string that says "YOUR-APP-TOKEN" with your own token.

Now you will be able to build/run your app. Users of your app will be able to send you text messages. These messages will show up in your inbox as e-mail. Your replies will automatically be transformed into messages in the app.

## License
[MIT](http://thi.mit-license.org)
