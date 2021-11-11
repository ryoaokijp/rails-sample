# rails-sample

## 構成
 - Ruby 2.5.1
 - Ruby on Rails 5.2.1
 - SQLite 3

## セットアップ※Windows
 - 参考記事
   - [WSLのインストール](https://docs.microsoft.com/ja-jp/windows/wsl/install)
   - [Windows10でWSLを使ってRails環境を構築したときのメモ](https://qiita.com/ksh-fthr/items/64a4e86c8bad08322c94)
   - [wslのUbuntuでRubyのインストールに挫折中です](https://teratail.com/questions/182233)
   - [chmod Operation not permittedというエラーについて](https://ja.stackoverflow.com/questions/60298/chmod-operation-not-permitted-%E3%81%A8%E3%81%84%E3%81%86%E3%82%A8%E3%83%A9%E3%83%BC%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)

1. WSL2(Ubuntu)のインストール
```bash
PowerShellで下記コマンドを実行
wsl --install -d Ubuntu
```
2. WSL(Ubuntu)のパッケージリストを更新
```bash
sudo apt-get update
sudo apt-get upgrade
```
3. 各種ライブラリをインストール
```bash
sudo apt-get install make
sudo apt-get install gcc
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev
```
4. Node.jsをインストール
```bash
sudo apt-get install npm
sudo npm install -g n
sudo n stable
node -v
```
5. rbenvをインストール
```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
```
6. ruby-buildをインストール
```bash
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```
7. Ruby2.5.1をインストール
```bash
rbenv install 2.5.1
rbenv rehash
rbenv global 2.5.1
ruby -v
```
8. Rails5.2.1をインストール
```bash
gem install rails -v 5.2.1
rails -v
```
9. SQLite3をインストール
```bash
sudo apt-get install libsqlite3-dev
gem install sqlite3 -v 1.3.13
sudo apt-get install sqlite3
```
10. bundlerをインストール
```bash
gem install bundler
```
11. metadataオプションを付けてWindowsフォルダを再マウント
```bash
sudo umount /mnt/c
sudo mount -t drvfs C: /mnt/c -o metadata
```
12. Railsプロジェクトを作成
```bash
ln -s /mnt/c/Users/{Windowsの任意ディレクトリ}
cd {Windowsの任意ディレクトリ}
rails new rails-sample
cd rails-sample/
rails s
```
  - プロジェクト作成で「Insecure world writable dir…」という警告がでたら[コチラ](https://www.oiax.jp/books/insecure_world_writable_dir.html)を参考に下記を追加
```bash
export PATH="$(echo "$PATH" | sed -r -e 's;:/mnt/[^:]+;;g')"
```
13. Webアクセス
  - [http://localhost:3000](http://localhost:3000)
