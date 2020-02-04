User.destroy_all
Post.destroy_all
Friendship.destroy_all
Comment.destroy_all
Like.destroy_all

pw = 'password'

User.create!(
    name:                   'Coldplay',
    email:                  'coldplay@email.com',
    influence:              'The Verve',
    location:               'London, England',
    started:                1996,
    password:               pw,
    password_confirmation:  pw
)

User.create!(
    name:                   'Radiohead',
    email:                  'radiohead@email.com',
    influence:              'Pink Floyd',
    location:               'Oxfordshire, England',
    started:                1985,
    password:               pw,
    password_confirmation:  pw
)

User.create!(
    name:                   'Jack Johnson',
    email:                  'jack@email.com',
    influence:              'The Ocean',
    location:               'USA',
    started:                2001,
    password:               pw,
    password_confirmation:  pw
)

User.create!(
    name:                   'Bonobo',
    email:                  'bonobo@email.com',
    influence:              'Just the vibe of life',
    location:               'USA',
    started:                2000,
    password:               pw,
    password_confirmation:  pw
)