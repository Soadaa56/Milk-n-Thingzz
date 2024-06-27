# Initial Craft table seed
# upsert_all used to update the initial db:seed on the VPS postgreSQl container that didn't have image_data

Craft.upsert_all([
  {
    id: 1,
    name: 'Flower Coffin',
    category: '3D-Print',
    image_data: "{\"id\":\"3f8bb7a70dba60ccdadaf670afa67e83.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"1_1.png\",\"size\":317509,\"mime_type\":\"image/png\"}}",
    created_at: '2024-06-18 21:24:10.507735',
    updated_at: '2024-06-18 21:24:10.507735'
  },
  {
    id: 2,
    name: 'Skull Pot',
    category: '3D-Print',
    image_data: "{\"id\":\"520dd64cafda92bb76dce5a50dff7d79.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"2_1.png\",\"size\":169026,\"mime_type\":\"image/png\"}}",
    created_at: '2024-06-18 21:24:10.512176',
    updated_at: '2024-06-18 21:24:10.512176'
  },
  {
    id: 3,
    name: 'Mushroom Earrings',
    category: '3D-Print',
    image_data: "{\"id\":\"6a736750c72819d71772d4f5651b7736.jpeg\",\"storage\":\"store\",\"metadata\":{\"filename\":\"3_1.jpeg\",\"size\":1587915,\"mime_type\":\"image/jpeg\"}}",
    created_at: '2024-06-18 21:24:10.515184',
    updated_at: '2024-06-18 21:24:10.515184'
  },
  {
    id: 4,
    name: 'Vase, White',
    category: '3D-Print',
    image_data: "{\"id\":\"1cbcc35aece4f4853a9fa41d33b36c7e.jpeg\",\"storage\":\"store\",\"metadata\":{\"filename\":\"4_1.jpeg\",\"size\":303276,\"mime_type\":\"image/jpeg\"}}",
    created_at: '2024-06-18 21:24:10.518344',
    updated_at: '2024-06-18 21:24:10.518344'
  },
  {
    id: 5,
    name: 'Flower Earrings, Pink',
    category: '3D-Print',
    image_data: "{\"id\":\"386dd0df2564b668ce66ab7a5d9344ba.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"5_1.png\",\"size\":141744,\"mime_type\":\"image/png\"}}",
    created_at: '2024-06-18 21:24:10.521558',
    updated_at: '2024-06-18 21:24:10.521558'
  },
  {
    id: 6,
    name: 'Scarf, Blue and Gray',
    category: 'Crotchet',
    image_data: "{\"id\":\"db330239b4e6b5701fea633c9f5ae633.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"1_1.png\",\"size\":194174,\"mime_type\":\"image/png\"}}",
    created_at: '2024-06-18 21:24:10.524692',
    updated_at: '2024-06-18 21:24:10.524692'
  },
  {
    id: 7,
    name: 'Scarf, Gray, Yellow, Pink and Purple',
    category: 'Crotchet',
    image_data: "{\"id\":\"f65290f2d1999a921fd08e5a811d0080.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"2_1.png\",\"size\":135779,\"mime_type\":\"image/png\"}}",
    created_at: '2024-06-18 21:24:10.527865',
    updated_at: '2024-06-18 21:24:10.527865'
  },
  {
    id: 8,
    name: 'Scarf, Pastel Rainbow',
    category: 'Crotchet',
    image_data: "{\"id\":\"f052099cd5a3fd75ca0cdaea066368f3.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"3_1.png\",\"size\":262016,\"mime_type\":\"image/png\"}}",
    created_at: '2024-06-18 21:24:10.530937',
    updated_at: '2024-06-18 21:24:10.530937'
  },
  {
    id: 9,
    name: 'Scarf, Blue',
    category: 'Crotchet',
    image_data: "{\"id\":\"897661432fe1bca731672da2fecb0578.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"4_1.png\",\"size\":170618,\"mime_type\":\"image/png\"}}",
    created_at: '2024-06-18 21:24:10.533817',
    updated_at: '2024-06-18 21:24:10.533817'
  },
  {
    id: 10,
    name: 'Ice King Crown',
    category: 'Embroidery',
    image_data: "{\"id\":\"aca040c362aa80c003a878f38c358700.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"1_1.png\",\"size\":178114,\"mime_type\":\"image/png\"}}",
    created_at: '2024-06-18 21:24:10.536888',
    updated_at: '2024-06-18 21:24:10.536888'
  },
  {
    id: 11,
    name: 'Companion Cube',
    category: 'Embroidery',
    image_data: "{\"id\":\"0f3298918147a9905b1576a3ae279d4e.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"2_1.png\",\"size\":238290,\"mime_type\":\"image/png\"}}",
    created_at: '2024-06-18 21:24:10.539997',
    updated_at: '2024-06-18 21:24:10.539997'
  }
], unique_by: :id)
