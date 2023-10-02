import express from 'express'
import knex from 'knex'
import cors from 'cors'

const app = express()
app.use(express.json())
app.use(cors())

const corsOptions = {
  origin: '*'
}

const db = knex({
  client: 'mysql2',
  connection: {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'users_crud_php'
  }
})

app.get('/user', cors(corsOptions), async (req, res) => {
  try {
    const userId = req.query.id
    if (!userId) return res.status(400).send('User ID not provided')

    const user = await db
      .select('name', 'lastname', 'password', 'email')
      .from('users')
      .where({ id: userId })
      .first()

    if (!user) return res.status(404).send('User not found')
    res.json(user)
  } catch (err) {
    console.error(err)
    res.status(500).send(`Error: ${err}`)
  }
})

app.post('/login', cors(corsOptions), async (req, res) => {
  try {
    const { email, password } = req.body
    const user = await db
      .select('id', 'name', 'email')
      .from('users')
      .where({ email, password })
      .first()
    if (!user) return res.status(401).send('User not found')

    res.json({ userId: user.id })
  } catch (err) {
    console.error(err)
    res.status(500).send(`Error: ${err}`)
  }
})

const PORT = process.env.PORT ?? 3000
app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`))
