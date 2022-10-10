const express = require('express')
const app = express()
const port = 3001
app.get('/', (req, res) => res.send("Welcome to setting up Node.js project tutorial!"))
app.listen(port, () => console.log(`Application listening on port ${port}!`))
