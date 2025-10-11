// src/router/index.ts
import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/AboutView.vue')
    },
    {
      path: '/model',
      name: 'model',
      component: () => import('../views/ModelView.vue')
    },
    {
      path: '/model/:id', // dynamic
      name: 'model-card',
      component: () => import('../views/ModelCardView.vue')
    },
    {
      path: '/docs',
      name: 'docs',
      component: () => import('../views/DocsView.vue')
    },
    {
      path: '/gradio',
      name: 'gradio',
      component: () => import('../views/Epcotgradio.vue')
    }
  ]
})

export default router