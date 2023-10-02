document.getElementById('loginForm').addEventListener('submit', async () => {
  const email = document.getElementById('email').value
  const password = document.getElementById('password').value

  const data = { email, password }

  try {
    await fetch('http://localhost:3000/login', {
      method: 'POST',
      body: JSON.stringify(data),
      headers: {
        'Content-Type': 'application/json'
      }
    })

      .then(response => response.json())
      .then(data => {
        localStorage.setItem('userId', data.userId)
        window.location.href = 'dashboard.html'
      })
  } catch (err) {
    console.error(err)
  }
})
