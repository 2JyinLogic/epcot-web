<template>
  <header class="navbar">
    <div class="left">
      <router-link to="/" class="logo-container">
        <img src="/images/logo.png" alt="EPCOT Logo" class="logo-image" />
        <span class="logo-text">EPCOT</span>
      </router-link>
    </div>
    <div class="right">
      <nav>
        <router-link to="/">Home</router-link>
        <router-link to="/model">Models</router-link>
        <router-link to="/about">About</router-link>
        <router-link to="/docs">Docs</router-link>
        <a href="#">Contact</a>
      </nav>
    </div>
  </header>
</template>

<script setup lang="ts">
// No external dependencies needed
</script>

<style scoped>
.navbar {
  background: #234274;;
  color: #fff;
  padding: 1rem 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-family: Arial, sans-serif;
}

.left {
  display: flex;
  align-items: center;
}

.logo-container {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  text-decoration: none;
  transition: opacity 0.3s ease;
}

.logo-container:hover {
  opacity: 0.8;
}

.logo-image {
  height: 48px;
  width: auto;
  object-fit: contain;
}

.logo-text {
  font-weight: bold;
  font-size: 1.8rem;
  color: #fff;
  text-decoration: none;
  letter-spacing: 0.5px;
}

.right {
  display: flex;
  align-items: center;
}

nav {
  display: flex;
  gap: 1rem;
}

a {
  color: #fff;
  text-decoration: none;
  font-weight: 500;
  font-size: 1.1rem;
  transition: color 0.3s ease;
}

a:hover {
  color: #94a3b8;
}

/* Responsive design */
@media (max-width: 768px) {
  .navbar {
    padding: 1rem;
  }
  
  .logo-image {
    height: 40px;
  }
  
  .logo-text {
    font-size: 1.5rem;
  }
  
  .logo-container {
    gap: 0.4rem;
  }
  
  nav {
    gap: 0.75rem;
  }
  
  nav a {
    font-size: 1rem;
  }
}

@media (max-width: 480px) {
  .logo-image {
    height: 36px;
  }
  
  .logo-text {
    font-size: 1.3rem;
  }
  
  .logo-container {
    gap: 0.3rem;
  }
  
  nav a {
    font-size: 0.95rem;
  }
}
</style>
