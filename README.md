# qa2_chatbot_app

社内用チャットボットプロトタイプ  
Rails 8 + MySQL + Tailwind CSS + JavaScript を使用したLINE風チャットUI。

---

## 📌 機能

- ユーザーがメッセージを送信
- チャットボットが内容を解析し、自動で応答
- メッセージ履歴をデータベースに保存
- LINE風のチャットUI（Tailwind使用）
- スクロールは下から上に自動調整（JavaScript）

---

## 🛠 使用技術

| 技術       | バージョン          |
|------------|---------------------|
| Ruby       | 3.2.x               |
| Rails      | 8.x                 |
| MySQL      | 8.x                 |
| TailwindCSS| 3.x                 |
| Node.js    | 16+ or 18+ or 20+   |

---

## 💾 モデル構成

### Message（メッセージ記録）

| カラム    | 型       | 説明                    |
|-----------|----------|-------------------------|
| content   | text     | メッセージ内容         |
| sender    | string   | 'user' or 'bot'         |
| created_at | datetime | 作成日時（自動）       |

---

## 🔧 セットアップ手順

```bash
# 1. clone or create project
rails new qa2_chatbot_app -d mysql
cd qa2_chatbot_app

# 2. インストール
bundle install

# 3. DB作成 & マイグレーション
rails db:create
rails db:migrate

# 4. Tailwindインストール
rails tailwindcss:install

# 5. サーバー起動
rails server
