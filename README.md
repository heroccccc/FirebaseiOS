# FirebaseiOS

## iosアプリとfirebaseの連携です。iosのアプリからfirebase上のデータの追加・更新…ができます。

---
### Firebaseとは…
#### googleが提供しているMBaas(Mobile Backend as a Service)
#### オンラインのデータベースにデータを保存・取得などができる
#### みなさんわかりやすくまとめてます
* ##### [FirebaseのRealtime Databaseのざっくり概要](https://qiita.com/seiya1121/items/1436fde30752843daa47)
* ##### [Firebaseの始め方](https://qiita.com/kohashi/items/43ea22f61ade45972881)

#### 今回はFirebaseをiOSで使用してみました
---
### 準備
### 1. firebaseのプロジェクトの作成
#### [こちらから](https://console.firebase.google.com)Firebaseのデータベースを登録していきます．
#### 新しいプロジェクトを作成します．作成すると次に、プロジェクト名等を入力してください．
<img src="https://github.com/heroccccc/FirebaseiOS/blob/master/images/firebasenewproject1.png"
 width="200" />

### 2. firebaseのプロジェクトの設定
#### 下の図のように順をおって入力していってください．
<img src="https://github.com/heroccccc/FirebaseiOS/blob/master/images/firebasenewproject2.png"
 width="200" />

#### iosハンドルIDはfirebaseを使用したいアプリのIDを使用します．下の図の青枠の部分を使用してください．
<img src="https://github.com/heroccccc/FirebaseiOS/blob/master/images/bundleiosID.png"
 width="200" />

### 3. iOSアプリにfirebaseSDKの追加
#### 2の途中でCocoaPodsでinstallする流れとなっていますが、少々使用方法によってinstallが異なるため注意してください．今回は以下の2つをinstallすることにしました．[いくつかあります](https://firebase.google.com/docs/ios/setup?hl=ja)
```
target 'FirebaseiOS' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'Firebase/Core'
  pod 'Firebase/Database'

  # Pods for FirebaseiOS

end

```
### 4.Databaseのルール設定
#### firebaseのプロジェクトのデータベースの、ルールより以下の通りに変更し、公開ボタンをおす．
<img src="https://github.com/heroccccc/FirebaseiOS/blob/master/images/firebaserurles.png .png" width="200" />

### 5.iOSアプリの初期設定(AppDelegate.swiftの設定)
#### AppDelegate.swiftとは[こちらより](https://qiita.com/SoyaTakahashi/items/cc8f48af792c353cd9f3)
#### 2つ追加する
```
import UIKit

//追加
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        //追加
        FirebaseApp.configure()
        return true
    }
    //以下省略…
```

### 準備完了!!!
#### 1度ビルドしてみてください．
---
### 使用
### 1.ViewController.swiftの編集
### databaseの更新を行っています．
```
import UIKit

//追加
import Firebase

class ViewController: UIViewController {

    //firebaseに追加するtext入力
    @IBOutlet weak var inputText: UITextField!

    // インスタンス変数
    var DBRef:DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //インスタンスを作成
        DBRef = Database.database().reference()

    }

    //sendボタンが押されたら
    @IBAction func sendFirebase(_ sender: Any) {

        //databaseにあげるデータ
        let data = ["name": inputText.text!]

        //databaseにあげるデータ更新
        DBRef.child("/").updateChildValues(data)


    }
    //以下省略…
```
### 2.ビルドして確認
---
### アプリからdatabaseの変更・更新などをリアルタイムにできる!!!
<img src="https://github.com/heroccccc/FirebaseiOS/blob/master/images/firebasedarabase.png .png" width="200" />
<img src="https://github.com/heroccccc/FirebaseiOS/blob/master/images/iosscreenshot.png .png" width="200" />
