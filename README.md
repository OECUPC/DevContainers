# Dev Containers
## 概要
開発用のDockerコンテナ環境をまとめたリポジトリ

## 必要なもの
- Docker/Docker Desktop
- VSCodeの拡張機能
    - Remote Development (publisher: Microsoft)

## インストール方法とか
公式サイト等に従ってインストールしてください

## 使い方とか
### コンテナの構築/起動
任意の環境のディレクトリに移動して、それぞれに配置されている`Dockerfile`から`docker`コマンドを用いてビルドを行う。
```powershell
> docker image build -t [イメージ名] .
> docker container run -it -d --name [コンテナ名] [イメージ名]
```

また、 一連のコマンドをバッチファイルやシェルスクリプトファイルをまとめてあるので、そこから実行する事も可能。
```powershell
> .\container_build.bat
```

```shell
$ ./container_build.sh
```

### コンテナ内で開発する
VSCode -> `リモートエクスプローラー` -> `リモートエクスプローラー: Containers` -> `CONTAINERS` -> `[構築したコンテナ名]`から`Attatch to Container`

### コンテナを停止させる
```powershell
> docker container stop [コンテナ名]
```

### 停止させたコンテナを起動させる(ビルド済みのコンテナ)
```powershell
> docker start [コンテナ名]
```

### ビルドしたコンテナを削除する
※コンテナ内のデータは全て削除されます。

起動している場合は停止させる。
```powershell
> docker container stop [コンテナ名]
```

```powershell
> docker rm [コンテナ名]
```

## コンテナ内で`git`を使う際
`git`を用いてプライベートリポジトリを`clone`する場合には、鍵を生成しGitHubの設定に公開鍵を登録する必要があります。

### 公開鍵の生成
```shell
$ ssh-keygen -C "[適当なユーザ名]@[適当な名称(コンテナ名とか)]"
Enter file in witch to save the key ~ : [Enter押す]
Enter passphrase (empty for no passphrase): [任意のパスワード]
Enter same passphrase again: [同じパスワード]

$ cat id_rsa.pub
ssh-rsa ~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```

表示された`ssh-rsa`以降の文字列をコピーしておきます。

### GitHubへの公開鍵を登録
GitHubの`Settings` -> `SSH and GPG keys` -> `New SSH key`をクリック。

`Title`を適当な名称に、`Key`を先ほどコピーした内容を貼り付け後、`Add SSH key`で追加。

### Gitの設定
```shell
$ git config --global user.name [GitHubでのID]
$ git config --global user.email [GitHubアカウントを登録しているメールアドレス]
```