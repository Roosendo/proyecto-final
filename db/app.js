import express from 'express'
import knex from 'knex'
import cors from 'cors'

const app = express()
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

app.get('/users', cors(corsOptions), async (req, res) => {
  try {
    const users = await db.select('*').from('users')
    res.json(users)
  } catch (err) {
    // console.error(err)
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
