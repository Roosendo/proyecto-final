const userId = localStorage.getItem('userId')
if (!userId) window.location.href = 'index.html'

const body = document.querySelector('body')
const sidebar = body.querySelector('nav')
const toggle = body.querySelector('.toggle')
const searchBtn = body.querySelector('.search-box')
const modeSwitch = body.querySelector('.toggle-switch')
const modeText = body.querySelector('.mode-text')
const home = body.querySelector('.home')

toggle.addEventListener('click', () => {
  sidebar.classList.toggle('close')
})

searchBtn.addEventListener('click', () => {
  sidebar.classList.remove('close')
})

modeSwitch.addEventListener('click', () => {
  body.classList.toggle('dark')

  if (body.classList.contains('dark')) {
    modeText.innerText = 'Light mode'
  } else {
    modeText.innerText = 'Dark mode'
  }
})

const createUser = async () => {
  await fetch('http://localhost:3000/users', {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    }
  })
    .then(response => response.json())
    .then(data => {
      data.forEach(user => {
        const p = document.createElement('p')
        p.innerHTML = `
          <p>Name: ${user.name} || Email: ${user.email}</p>
        `
        return home.appendChild(p)
      })
    })
}

createUser()
