p "create Users"
User.create!(
  email: 'user1@example.com',
  password: 'aaaaaaaa',
  name: 'ナスチャ',
  self_introduction: 'ナスチャです',
  sex: 0,
  img_name: open("#{Rails.root}/db/dummy_img/123.jpg")
)
User.create!(
  email: 'user2@example.com',
  password: 'aaaaaaaa',
  name: 'サーシャ',
  self_introduction: 'サーシャです',
  sex: 0,
  img_name: open("#{Rails.root}/db/dummy_img/223.jpg")
)
User.create!(
  email: 'user3@example.com',
  password: 'aaaaaaaa',
  name: 'オリヴィア',
  self_introduction: 'オリヴィアです',
  sex: 1,
  img_name: open("#{Rails.root}/db/dummy_img/3.jpg")
)
User.create!(
  email: 'user4@example.com',
  password: 'aaaaaaaa',
  name: 'リリー',
  self_introduction: 'リリーです',
  sex: 1,
  img_name: open("#{Rails.root}/db/dummy_img/423.jpg")
)
