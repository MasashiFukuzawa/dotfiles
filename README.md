# 1. iTerm2のインストール
- [https://iterm2.com/](https://iterm2.com/) からiTerm2をインストール

# 2. iTerm2のショートカット設定
- [iTerm2のおすすめ設定〜ターミナル作業を効率化する〜](https://qiita.com/ruwatana/items/8d9c174250061721ad11)
  - これを設定することで、alt + space キーでiTerm2をその場に開くことができるようになるので便利
  - TotalSpace2を使ってる場合はiTerm2をAll Spacesで開けるようにしておくこと

## 参考 - iTerm2のショートカット
- [iTerm2ショートカット備忘録](https://qiita.com/0084ken/items/8aefabef4fd3cfdf8fce)

# 3. カラー設定
- GitHub: [MartinSeeler/iterm2-material-design](https://github.com/MartinSeeler/iterm2-material-design)

```sh
$ cd somewhere
$ git clone git@github.com:MartinSeeler/iterm2-material-design.git`
$ cd iterm2-material-design`
$ cp material-design-colors.itermcolors ~/iterm`
$ cd .. && rm -rf iterm2-material-design`
 ```

- iTerm2のタブのiTerm2→preference→Profiles→Colors→Color Presets→impor`~/iterm/material-design-colors.itermcolors`を選択
- iTerm2のタブのiTerm2→preference→Profiles→Colors→Color Presetsより、`material-design-colors`を選択
- [![Image](https://gyazo.com/6b58fdadfde82e9d66398f1dc4d76cd1/thumb/1000)](https://gyazo.com/6b58fdadfde82e9d66398f1dc4d76cd1)

# 4. Zsh設定
- [初心者向け：Zshの導入](https://qiita.com/iwaseasahi/items/a2b00b65ebd06785b443#oh-my-zsh)
  - Oh-my-zshの導入まで
  - テーマは`powerlevel9k`にするので設定は参考にならない
- `.zshrc`にalias設定などを書いておく

# 5. プロンプト設定
- `git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`
- [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts/blob/e9ec3ae4548e59eb9a6531f38370cb99ca591e16/patched-fonts/Meslo/L-DZ/complete/Meslo%20LG%20L%20DZ%20Regular%20Nerd%20Font%20Complete.otf)をインストール
  - 中央にあるView rawを押せばダウンロードが始まる
- フォントをmacに読み込ませる
- あとは[この素晴らしい例](https://github.com/Powerlevel9k/powerlevel9k/wiki/Show-Off-Your-Config#hacckss-config)の`.zshrc`の設定を見ながら微修正するだけ

# 6. NeoVim設定
- [はじめてのNeoVim（初期設定編）](https://qiita.com/hisayuki/items/99ea1b667de71e908891)を見ながら初期設定
  - 詳細設定は変えるので枠組みだけ参考にする
- 設定ファイルは`.vimrc`ではなく、`.config/nvim/init.vim`になることに注意
- pluginが上手く入らない時は、`call map(dein#check_clean(), "delete(v:val, 'rf')")`を`.config/nvim/init.vim`に追記して再起動→`:call dein#recache_runtimepath()` を実行
- これを実行しないとプラグインが残ったままになるとのこと
  - [dein.vimでのプラグイン削除](http://katsumeshix.hatenablog.jp/entry/2017/10/16/103709)
- 設定は基本的に伊藤純一さんのを参考にした
  - [https://github.com/JunichiIto/dotfiles/blob/master/.vimrc](https://github.com/JunichiIto/dotfiles/blob/master/.vimrc)
  - [https://qiita.com/jnchito/items/5141b3b01bced9f7f48f](https://qiita.com/jnchito/items/5141b3b01bced9f7f48f)
- devin.vimのポイント
  - `.config/nvim/dein.toml`に毎度読み込むプラグインを記述
  - ここには設定詳細は書かない
  - 最初躓いた
