Genre.create([
    { name: '小説' },
    { name: '漫画' },
    { name: '伝記'},
    { name: '実用書'},
    { name: '教育書'},
    ])

User.create!(
   email: "admin@example.jp",
    name: "管理者",
password: "123456",
  admin: true )
