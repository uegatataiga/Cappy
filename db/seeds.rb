Genre.create([
    { name: '猫じゃらし' },
    { name: 'ボール型' },
    { name: '電動'},
    { name: '知育玩具'},
    { name: 'トンネル'},
    { name: 'その他'},
    ])

User.create!(
   email: "admin@example.jp",
    name: "管理者",
password: "123456",
  admin: true )
