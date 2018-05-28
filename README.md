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

