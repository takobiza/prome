# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|uid|string||
|provider|String||

### Association
- has_many :templates

## templatesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|questions_id|references|null: false, foreign_key: true|

### Association
- belong_to :user
- has_many :profiles
- has_one :questions

## questionsテーブル
|Column|Type|Options|
|------|----|-------|
|question1|string|null: false|
|question2|string|null: false|
|question3|string|null: false|
|question4|string|null: false|
|question5|string|null: false|
|templates_id|references|null: false, foreign_key: true|

### Association
- belongs_to :templates

## Profilesテーブル
|Column|Type|Options|
|------|----|-------|
|respondents_id|references|null: false, foreign_key: true|
|templates_id|references|null: false, foreign_key: true|

### Association
- has_many :respondents
- belong_to :template

## respondentsテーブル
|Column|Type|Options|
|------|----|-------|
|first_person|integer|null: false|
|birthday|Srting|null: false|
|blood|Srting|null: false|
|sign|Srting|null: false|
|charmpoint|Srting|null: false|
|personality|Srting|null: false|
|skill|Srting|null: false|
|hobby|Srting|null: false|
|favoritefood|Srting|null: false|
|dislikefood|Srting|null: false|
|dream|Srting|null: false|
|wish|Srting|null: false|
|profiles_id|references|null: false, foreign_key: true|

### Association
- belong_to :profile
- has_one :answer

## answerテーブル
|Column|Type|Options|
|------|----|-------|
|answer1|string|null: false|
|answer2|string|null: false|
|answer3|string|null: false|
|answer4|string|null: false|
|answer5|string|null: false|
|respondents_id|references|null: false, foreign_key: true|

### Association
- belong_to :respondent
