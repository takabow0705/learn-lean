# Lean 4 開発環境

VS Code の Dev Containers を使う Lean 4 の開発環境です。Lean のバージョンは `lean-toolchain` で固定しています。コンテナには Lean のバージョン管理ツール elan、Git、SSH クライアント、Codex CLI と VS Code の Lean 4 拡張機能が入ります。

## 起動

1. Docker、VS Code、VS Code の **Dev Containers** 拡張機能をインストールし、Docker を起動します。
2. このフォルダを VS Code で開き、コマンドパレットから **Dev Containers: Reopen in Container** を選びます。
3. 初回はイメージのビルド後、`lean-toolchain` に指定された Lean がダウンロードされます。`example.lean` を開くと Lean 拡張機能を利用できます。

コンテナのターミナルで `lean --version`、`lake --version`、`git --version` を実行して確認できます。Lean のバージョンを変更する場合は `lean-toolchain` を編集してください。

## Codex CLI

コンテナのビルド時に `.devcontainer/install-codex.sh` が Codex CLI の最新版をインストールします。既存のコンテナに反映するには、VS Code のコマンドパレットから **Dev Containers: Rebuild Container** を実行してください。

コンテナのターミナルで `codex --version` を確認し、`codex` を起動して画面の案内に従ってサインインします。更新するには `sh .devcontainer/install-codex.sh` を実行します。特定のバージョンを指定する場合は `CODEX_VERSION=バージョン sh .devcontainer/install-codex.sh` を実行してください。ビルド時に毎回同じバージョンを使う場合は、Dockerfile のスクリプト実行行に同様に `CODEX_VERSION` を指定してください。

## Git

このフォルダがまだ Git リポジトリでない場合は、ホストまたはコンテナのターミナルで以下を実行します。

```sh
git init
git add .
git commit -m "Initial commit"
```

コミット時に名前とメールアドレスが未設定なら、`git config --global user.name "名前"` と `git config --global user.email "メールアドレス"` を設定してください。VS Code の Dev Containers は通常、ホストの Git 設定や SSH エージェントをコンテナに引き継げます。認証にはホスト側の SSH エージェントや HTTPS の認証情報ヘルパーを設定してください。

リモートリポジトリを作成済みの場合は、表示された URL を使って `git remote add origin <URL>` と `git push -u origin HEAD` を実行します。認証情報や秘密鍵をこのフォルダに保存・コミットしないでください。

## 参考資料
[ゼロから始めるLean言語入門 ― 手を動かして学ぶ形式数学ライブラリ開発](https://www.lambdanote.com/products/leanbook)
[Lean で手続き的プログラム の証明が書けるようになった](https://speakerdeck.com/inoueasei/slide-aa115490-ea99-4286-9de2-40794f4e861f)