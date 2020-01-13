# README

## ↓↓↓DB設計↓↓↓
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|

### Association
- has_many :posts
- has_many :comments
- has_many :likes

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|message|text||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :posts_tags
- has_many :tags, through: :posts_tags

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
|commrnt|text||

### Association
- belongs_to :user
- belongs_to :post

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|like|boolean|default: false|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|strings||

### Association
- has_many :post_tags
- has_many :posts, through: :posts_tags

## post-tagsテーブル(中間テーブル)
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post
## ↑↑↑DB設計↑↑↑
