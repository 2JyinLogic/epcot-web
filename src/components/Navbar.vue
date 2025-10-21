<template>
  <header class="navbar">
    <div class="left">
      <router-link to="/" class="logo-container">
        <img src="/images/logo.png" alt="EPCOT Logo" class="logo-image" />
        <span class="logo-text">EPCOT</span>
      </router-link>
    </div>
    <div class="right">
      <nav style="display: none;">
        <router-link to="/">Home</router-link>
        <router-link to="/model">Models</router-link>
        <router-link to="/about">About</router-link>
        <router-link to="/docs">Docs</router-link>
        <a href="https://jieliu6.github.io/" target="_blank" rel="noopener noreferrer">Contact</a>
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
    padding: 0.75rem 1rem;
    flex-wrap: wrap;
  }
  
  .logo-image {
    height: 36px;
  }
  
  .logo-text {
    font-size: 1.4rem;
  }
  
  .logo-container {
    gap: 0.3rem;
  }
  
  nav {
    gap: 0.5rem;
    flex-wrap: wrap;
  }
  
  nav a {
    font-size: 0.9rem;
    padding: 0.25rem 0.5rem;
    white-space: nowrap;
  }
}

@media (max-width: 640px) {
  .navbar {
    padding: 0.5rem 0.75rem;
  }
  
  .logo-image {
    height: 32px;
  }
  
  .logo-text {
    font-size: 1.2rem;
  }
  
  nav {
    gap: 0.4rem;
  }
  
  nav a {
    font-size: 0.85rem;
    padding: 0.2rem 0.4rem;
  }
}

@media (max-width: 480px) {
  .navbar {
    padding: 0.5rem;
    flex-direction: column;
    gap: 0.5rem;
  }
  
  .left, .right {
    width: 100%;
    justify-content: center;
  }
  
  .logo-image {
    height: 28px;
  }
  
  .logo-text {
    font-size: 1.1rem;
  }
  
  nav {
    gap: 0.3rem;
    justify-content: center;
  }
  
  nav a {
    font-size: 0.8rem;
    padding: 0.15rem 0.3rem;
  }
}
</style>
