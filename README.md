# KMR-zoar/spigot

このリポジトリには [Spigot](http://www.spigotmc.org/wiki/about-spigot/)をビルドして実行するdockerfile が入っています。

## 使い方

### コンテナのビルド

展開したリポジトリに移動してビルドします。

```
$ docker build -t zoar/spigot .
```

### コンテナの実行

```
$ docker run -d -p 25565:25565 -v path_to_data:/data zoar/spigot
```

## データディレクトリ

コンテナの `/data` にデータが保存されます。コンテナ実行時に適当なディレクトリを `/data` にバインドして永続化してください。  
ワールドのセーブデータやプラグインはここに入れておけば使うことができます。

## EULA への同意

新規にサーバーを立ち上げた場合、サーバーを実行するには [Minecraft の EULA](https://account.mojang.com/documents/minecraft_eula) に同意する必要があるため、サーバーの起動に失敗します。  
`path_to_data` で指定したディレクトリに `eula.txt` が生成されているので EULA に同意できればファイル内の `eula=false` を `eula=true` に書き換えることでコンテナを実行できるようになります。
