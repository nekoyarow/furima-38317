# テーブル設計

## usersテーブル

| Column                | Type     | Options     | 
| --------------------- | -------- | ----------- | 
| nickname              | string   | null: false | 
| email                 | string   | null: false, unique: true  | 
| encrypted_password    | string   | null: false | 
| family_name           | string   | null: false | 
| first_name            | string   | null: false | 
| family_name_kana      | string   | null: false | 
| first_name_kana       | string   | null: false | 
| date_of_birth         | date     | null: false | 


### Association
- has_many :items
- has_many :purchases


## itemsテーブル

| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ | 
| name          | string     | null: false                    | 
| description   | text       | null: false                    | 
| category_id   | integer     | null: false                    | 
| status_id | integer     | null: false                    | 
| cost_id   | integer     | null: false                    | 
| area_id   | integer     | null: false                    | 
| shipdate_id   | integer     | null: false                    | 
| price         | integer    | null: false                    | 
| user          | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one :purchases


## purchasesテーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ | 
| user    | references | null: false, foreign_key: true | 
| item    | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
- has_one : address


## addressesテーブル

| Column   | Type       | Options                        | 
| -------- | ---------- | ------------------------------ | 
| zipcode  | string     | null: false                    | 
| area_id 　| integer     | null: false                    | 
| city     | string     | null: false                    | 
| address1 | string     | null: false                    | 
| address2 | string     | null: false                    | 
| phone    | string     | null: false                    | 
| purchases  | references | null: false, foreign_key: true | 

### Association
- belongs_to :purchases