<template>
  <div class="home-container">
    <!-- Hero Section -->
    <section class="hero-section">
      <div class="hero-content">
        <h1 class="hero-title">
          <span class="title-primary">EPCOT</span><span class="title-secondary">Decoding Data's Gene Regulatory Code</span>
        </h1>
        <p class="hero-subtitle">
          Transform your genomic research with AI. Get comprehensive predictions of gene activity, protein binding, and DNA structure 
          from simple accessibility data. Save months of experiments and thousands in costs.
        </p>
        
        <!-- Stats Module -->
        <div class="stats-module">
          <div class="stat-item">
            <span class="stat-number">1000+</span>
            <span class="stat-label">Proteins Predicted</span>
          </div>
          <div class="stat-item">
            <span class="stat-number">11</span>
            <span class="stat-label">DNA Marks</span>
          </div>
          <div class="stat-item">
            <span class="stat-number">2</span>
            <span class="stat-label">Species</span>
          </div>
        </div>

        <!-- Try Web Version Button - Below stats -->
        <div class="hero-primary-action">
          <a href="https://huggingface.co/spaces/epcot-project/epcot-demo" target="_blank" class="btn-primary" aria-label="Try EPCOT web demo">
            Try Web Version
          </a>
        </div>

        <!-- Animated Background -->
        <div class="animated-background">
          <!-- Input Image -->
          <div class="input-image-container">
            <img src="/images/input.png" alt="Input Data" class="input-image" />
          </div>
              
          <!-- AI Core -->
          <div class="ai-core">
            <div class="ai-label">AI Core</div>
            <div class="core-pulse"></div>
            <div class="core-inner">
              <div class="neural-node" v-for="i in 6" :key="`node-${i}`" :style="{ animationDelay: `${i * 0.1}s` }"></div>
            </div>
          </div>
          
          <!-- Picture1 Image -->
          <div class="picture1-container">
            <img src="/images/Picture1.png" alt="EPCOT Workflow Diagram" class="picture1-image" />
          </div>
          
          <!-- Connection Lines -->
          <svg class="connection-lines" viewBox="0 0 1000 400" preserveAspectRatio="none">
            <defs>
              <linearGradient id="flowGradient" x1="0%" y1="0%" x2="100%" y2="0%">
                <stop offset="0%" style="stop-color:#3bd4c6;stop-opacity:0.3" />
                <stop offset="50%" style="stop-color:#1e40af;stop-opacity:0.8" />
                <stop offset="100%" style="stop-color:#3bd4c6;stop-opacity:0.3" />
              </linearGradient>
            </defs>
            <path class="flow-path" d="M 200 200 Q 500 100 800 200" stroke="url(#flowGradient)" stroke-width="2" fill="none" opacity="0.6"/>
            <path class="flow-path" d="M 200 200 Q 500 300 800 200" stroke="url(#flowGradient)" stroke-width="2" fill="none" opacity="0.4"/>
          </svg>
        </div>

        <!-- Secondary Action Buttons -->
        <div class="hero-actions">
          <a href="https://colab.research.google.com/github/epcot-project/epcot/blob/main/notebooks/demo.ipynb" target="_blank" class="btn-secondary" aria-label="View Google Colab tutorial">
            View Colab Tutorial
          </a>
          <a href="https://github.com/epcot-project/epcot" target="_blank" class="btn-secondary" aria-label="Browse source code on GitHub">
            Browse Source Code
          </a>
        </div>
      </div>
    </section>

    <!-- Demo Video Section -->
    <section class="video-section">
      <h2>Dynamic Demonstration</h2>
              <div class="video-container">
          <video controls aria-label="EPCOT presentation video">
            <source src="/videos/Presentation.mp4" type="video/mp4" />
            Your browser does not support the video tag.
          </video>
        </div>
      
      <!-- Interactive Video Workflow Subsection -->
      <div class="workflow-subsection">
        <div class="workflow-container">
          <!-- Tab Navigation -->
          <div class="workflow-tabs">
            <div class="arrow-left-outer" @click="previousTab">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M15 18l-6-6 6-6"/>
              </svg>
            </div>
            <button 
              v-for="(tab, index) in workflowTabs" 
              :key="index"
              class="workflow-tab"
              :class="{ active: activeTab === index }"
              @click="switchTab(index)"
            >
              {{ tab.title }}
            </button>
            <div class="arrow-right-outer" @click="nextTab">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M9 18l6-6-6-6"/>
              </svg>
            </div>
          </div>
          
          <!-- Video and Text Layout -->
          <div class="workflow-content">
            <!-- Left: Video Player -->
            <div class="workflow-video-panel">
              <video controls :key="activeTab">
                <source :src="workflowTabs[activeTab].videoSrc" type="video/mp4" />
                Your browser does not support the video tag.
              </video>
            </div>
            
            <!-- Right: Text Description -->
            <div class="workflow-text-panel">
              <div class="text-content">
                <h4>{{ workflowTabs[activeTab].title }}</h4>
                <p>{{ workflowTabs[activeTab].description }}</p>
                <a :href="workflowTabs[activeTab].tryLink" target="_blank" class="try-it-btn">
                  Try it now
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M7 17L17 7M17 7H7M17 7V17"/>
                  </svg>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Challenge & Solution Section -->
    <section class="challenge-section">
      <div class="challenge-container">
        <h2>Why Choose EPCOT?</h2>
        <div class="challenge-grid">
          <div class="challenge-card">
            <h3>Traditional Methods</h3>
            <ul>
              <li>
                <div class="challenge-icon">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
                  </svg>
                </div>
                <span><strong>Multiple Experiments</strong> – Each data type requires separate assays, increasing time demands.</span>
              </li>
              <li>
                <div class="challenge-icon">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="12" r="10"/>
                    <path d="M12 6v6l4 2"/>
                  </svg>
                </div>
                <span><strong>Data Gaps</strong> – Many cell types lack complete genomic profiles.</span>
              </li>
              <li>
                <div class="challenge-icon">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 2v20M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
                  </svg>
                </div>
                <span><strong>High Costs</strong> – Specialized sequencing and protocols are expensive.</span>
              </li>
              <li>
                <div class="challenge-icon">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
                  </svg>
                </div>
                <span><strong>Complex Workflows</strong> – Procedures are technically demanding and resource-intensive.</span>
              </li>
            </ul>
          </div>
          
          <div class="arrow-container">
            <div class="arrow">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M5 12h14M12 5l7 7-7 7"/>
              </svg>
            </div>
          </div>
          
          <div class="solution-card">
            <h3>EPCOT Solution</h3>
            <ul>
              <li>
                <div class="solution-icon">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M9 12l2 2 4-4M21 12c0 4.97-4.03 9-9 9s-9-4.03-9-9 4.03-9 9-9 9 9 4.03 9 9z"/>
                  </svg>
                </div>
                <span><strong>Multi-Modal in One</strong> – Single ATAC-seq predicts multiple data types.</span>
              </li>
              <li>
                <div class="solution-icon">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                    <circle cx="9" cy="7" r="4"/>
                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                    <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                  </svg>
                </div>
                <span><strong>Universal Compatibility</strong> – Works across all cell types automatically.</span>
              </li>
              <li>
                <div class="solution-icon">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 2v20M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
                  </svg>
                </div>
                <span><strong>Cost-Effective & Efficient</strong> – Replaces expensive assays with accurate predictions.</span>
              </li>
              <li>
                <div class="solution-icon">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M9 12l2 2 4-4M21 12c0 4.97-4.03 9-9 9s-9-4.03-9-9 4.03-9 9-9 9 9 9 4.03 9 9z"/>
                  </svg>
                </div>
                <span><strong>Proven Performance</strong> – Outperforms task-specific models in predictions.</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <!-- Publications Section -->
    <section class="publications-section">
      <h2>Read Our Publications</h2>
      <div class="publications-grid">
        <div class="publication-card" @click="openPaper('epcot')">
          <h3>EPCOT (2023)</h3>
          <p>"A framework to predict gene activity, protein binding, and DNA structure from accessibility data."</p>
          <span class="journal">Nucleic Acids Research</span>
        </div>
        <div class="publication-card" @click="openPaper('epcotv2')">
          <h3>EPCOTv2 (2025)</h3>
          <p>"Developing a general AI model for comprehensive genomic predictions and analysis."</p>
          <span class="journal">bioRxiv</span>
        </div>
      </div>

    </section>



  </div>
</template>

<script setup lang="ts">

import { onMounted, ref } from 'vue'

// Picture1 image data

// Workflow tabs data
const activeTab = ref(0)

const workflowTabs = [
  {
    title: 'Process accessibility data',
    videoSrc: '/videos/workflow-atac.mp4',
    description: 'Learn how to prepare your data for analysis. This tutorial shows you how to convert raw accessibility data into the format needed for EPCOT predictions.',
    tryLink: 'https://colab.research.google.com/github/epcot-project/epcot/blob/main/notebooks/data_preparation.ipynb'
  },
  {
    title: 'Try EPCOT',
    videoSrc: '/videos/workflow-epcot.mp4',
    description: 'See how to run predictions with the original EPCOT model. This video walks you through loading the model, uploading your data, and generating results.',
    tryLink: 'https://huggingface.co/spaces/epcot-project/epcot-demo'
  },
  {
    title: 'Try EPCOTv2',
    videoSrc: '/videos/workflow-epcotv2.mp4',
    description: 'Explore the newer EPCOTv2 model with its user-friendly web interface. Learn how to upload data and select what you want to predict.',
    tryLink: 'https://huggingface.co/spaces/luosanj/EPCOTv2'
  },
  {
    title: 'Visualize results',
    videoSrc: '/videos/workflow-visualize.mp4',
    description: 'Learn how to view and understand your prediction results. This tutorial shows you how to visualize the output data in genome browsers and other tools.',
    tryLink: 'https://colab.research.google.com/github/epcot-project/epcot/blob/main/notebooks/visualization.ipynb'
  }
]

const switchTab = (index: number) => {
  activeTab.value = index
}

const previousTab = () => {
  if (activeTab.value > 0) {
    activeTab.value--
  }
}

const nextTab = () => {
  if (activeTab.value < workflowTabs.length - 1) {
    activeTab.value++
  }
}

// Paper links
const openPaper = (paperType: string) => {
  const links = {
    epcot: 'https://academic.oup.com/nar/article/51/12/5931/7177889?login=true',
    epcotv2: 'https://www.biorxiv.org/content/10.1101/2025.05.08.652986v1.full.pdf'
  }
  
  if (links[paperType]) {
    window.open(links[paperType], '_blank')
  }
}


</script>

<style scoped>
.home-container {
  max-width: 1400px;
  margin: 0 auto;
  padding: 0 1rem;
}

/* Hero Section */
.hero-section {
  text-align: center;
  padding: 3rem 0 4rem 0;
  margin-bottom: 2rem;
  position: relative;
}

/* Animated Background */
.animated-background {
  position: relative;
  width: 100%;
  height: 300px;
  margin: 2rem 0 4rem 0;
  pointer-events: none;
  overflow: hidden;
  background: linear-gradient(135deg, rgba(59, 212, 198, 0.05) 0%, rgba(30, 64, 175, 0.05) 100%);
  border-radius: 1rem;
}

/* Input Image */
.input-image-container {
  position: absolute;
  left: 15%;
  top: 50%;
  transform: translateY(-50%);
  z-index: 2;
  width: 200px;
  height: 130px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.input-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
  transition: transform 0.3s ease;
}

.input-image:hover {
  transform: scale(1.05);
}

/* AI Core */
.ai-core {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  z-index: 3;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
  filter: drop-shadow(0 0 20px rgba(59, 130, 246, 0.3));
}

.ai-label {
  font-size: 12px;
  color: #64748b;
  font-weight: 500;
  text-align: center;
  white-space: nowrap;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.ai-core::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 140px;
  height: 140px;
  border: 1px solid rgba(59, 212, 198, 0.2);
  border-radius: 50%;
  animation: outerPulse 3s ease-in-out infinite;
}

.core-pulse {
  width: 100px;
  height: 100px;
  border: 3px solid rgba(59, 212, 198, 0.3);
  border-radius: 50%;
  animation: corePulse 2s ease-in-out infinite;
  background: radial-gradient(circle, rgba(59, 130, 246, 0.2) 0%, rgba(16, 185, 129, 0.1) 70%, transparent 100%);
  box-shadow: 
    0 0 30px rgba(59, 130, 246, 0.4),
    inset 0 0 20px rgba(59, 130, 246, 0.2);
}

.core-inner {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 70px;
  height: 70px;
  background: radial-gradient(circle, #1e40af, #3bd4c6, #8b5cf6);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  gap: 6px;
  box-shadow: 
    0 0 20px rgba(59, 130, 246, 0.6),
    inset 0 0 15px rgba(255, 255, 255, 0.1);
}

.neural-node {
  width: 12px;
  height: 12px;
  background: radial-gradient(circle, rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.6));
  border-radius: 50%;
  animation: nodePulse 1.5s ease-in-out infinite;
  box-shadow: 
    0 0 8px rgba(255, 255, 255, 0.8),
    inset 0 0 4px rgba(255, 255, 255, 0.3);
}

/* Picture1 Container */
.picture1-container {
  position: absolute;
  right: 5%;
  top: 50%;
  transform: translateY(-50%);
  z-index: 2;
  width: 250px;
  height: 250px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.picture1-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
  transition: transform 0.3s ease;
}

.picture1-image:hover {
  transform: scale(1.05);
}

/* Connection Lines */
.connection-lines {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
}

/* Floating Particles */
.animated-background::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: 
    radial-gradient(circle at 20% 30%, rgba(59, 212, 198, 0.15) 1px, transparent 1px),
    radial-gradient(circle at 80% 70%, rgba(30, 64, 175, 0.12) 1px, transparent 1px),
    radial-gradient(circle at 40% 80%, rgba(16, 185, 129, 0.1) 1px, transparent 1px),
    radial-gradient(circle at 60% 20%, rgba(245, 158, 11, 0.08) 1px, transparent 1px),
    radial-gradient(circle at 90% 40%, rgba(139, 92, 246, 0.1) 1px, transparent 1px);
  background-size: 100px 100px, 150px 150px, 80px 80px, 120px 120px, 90px 90px;
  animation: particleFloat 25s linear infinite;
}

/* Data Flow Arrows */
.animated-background::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 15%;
  width: 70%;
  height: 2px;
  background: linear-gradient(90deg, 
    transparent 0%, 
    rgba(59, 212, 198, 0.3) 15%, 
    rgba(30, 64, 175, 0.6) 50%, 
    rgba(59, 212, 198, 0.3) 85%, 
    transparent 100%);
  transform: translateY(-50%);
  animation: dataFlow 4s ease-in-out infinite;
}

.flow-path {
  animation: pathFlow 3s ease-in-out infinite;
}

/* Animations */
@keyframes dnaFlow {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}



@keyframes peakPulse {
  0%, 100% { opacity: 0.6; }
  50% { opacity: 1; }
}

@keyframes corePulse {
  0%, 100% { 
    transform: scale(1);
    opacity: 0.3;
    box-shadow: 0 0 30px rgba(59, 130, 246, 0.4);
  }
  50% { 
    transform: scale(1.1);
    opacity: 0.6;
    box-shadow: 0 0 40px rgba(59, 130, 246, 0.6);
  }
}

@keyframes nodePulse {
  0%, 100% { 
    transform: scale(1);
    opacity: 0.8;
    box-shadow: 0 0 8px rgba(255, 255, 255, 0.8);
  }
  50% { 
    transform: scale(1.2);
    opacity: 1;
    box-shadow: 0 0 12px rgba(255, 255, 255, 1);
  }
}

@keyframes streamFlow {
  0%, 100% { 
    width: 60px;
    opacity: 0.6;
  }
  50% { 
    width: 80px;
    opacity: 1;
  }
}

@keyframes dataPointPulse {
  0%, 100% { 
    transform: scale(1);
    opacity: 0.6;
  }
  50% { 
    transform: scale(1.3);
    opacity: 1;
  }
}

@keyframes pathFlow {
  0%, 100% { 
    stroke-dasharray: 0 1000;
    stroke-dashoffset: 0;
  }
  50% { 
    stroke-dasharray: 1000 0;
    stroke-dashoffset: -1000;
  }
}

@keyframes particleFloat {
  0% { transform: translateY(0px) translateX(0px) rotate(0deg); }
  25% { transform: translateY(-15px) translateX(8px) rotate(90deg); }
  50% { transform: translateY(-8px) translateX(-8px) rotate(180deg); }
  75% { transform: translateY(12px) translateX(5px) rotate(270deg); }
  100% { transform: translateY(0px) translateX(0px) rotate(360deg); }
}

@keyframes outerPulse {
  0%, 100% { 
    transform: translate(-50%, -50%) scale(1);
    opacity: 0.2;
  }
  50% { 
    transform: translate(-50%, -50%) scale(1.2);
    opacity: 0.4;
  }
}

@keyframes dataFlow {
  0% { 
    transform: translateY(-50%) translateX(-100%);
    opacity: 0;
    filter: blur(0px);
  }
  50% { 
    opacity: 1;
    filter: blur(0.5px);
  }
  100% { 
    transform: translateY(-50%) translateX(100%);
    opacity: 0;
    filter: blur(0px);
  }
}



/* Enhanced animations for better visual flow */
@keyframes baseGlow {
  0%, 100% {
    opacity: 0.7;
    transform: scale(1);
  }
  50% {
    opacity: 1;
    transform: scale(1.05);
  }
}





.hero-content {
  max-width: 1000px;
  margin: 0 auto;
  position: relative;
}

.hero-title {
  font-size: 3.5rem;
  font-weight: 800;
  margin-bottom: 3rem;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  line-height: 1.1;
  letter-spacing: -0.02em;
  white-space: nowrap;
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
}

.title-primary {
  background: linear-gradient(135deg, #1e40af 0%, #3bd4c6 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.title-secondary {
  color: #1e293b;
  font-weight: 600;
}

.hero-subtitle {
  font-size: 1.1rem;
  font-weight: 400;
  margin-bottom: 3rem;
  color: #475569;
  line-height: 1.7;
  max-width: 900px;
  margin-left: auto;
  margin-right: auto;
  letter-spacing: 0.01em;
  text-align: center;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

/* Stats Module */
.stats-module {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 4rem;
  margin-bottom: 4rem;
  flex-wrap: wrap;
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}

.stat-item {
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
}

.stat-number {
  font-size: 2rem;
  font-weight: 800;
  color: #3bd4c6;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  line-height: 1;
  text-align: center;
}

.stat-label {
  font-size: 0.8rem;
  font-weight: 500;
  color: #64748b;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  text-align: center;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

/* Primary Action Button */
.hero-primary-action {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 2rem 0 3rem 0;
  max-width: 1000px;
  margin-left: auto;
  margin-right: auto;
}

/* Hero Actions */
.hero-actions {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 2rem;
  flex-wrap: wrap;
  margin: 2rem 0 3rem 0;
  max-width: 1000px;
  margin-left: auto;
  margin-right: auto;
}

.btn-primary {
  background: linear-gradient(135deg, #0891b2 0%, #06b6d4 100%);
  color: white;
  padding: 1rem 2.5rem;
  border-radius: 0.75rem;
  text-decoration: none;
  font-weight: 600;
  font-size: 1rem;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  transition: all 0.3s ease;
  box-shadow: 0 6px 20px rgba(6, 182, 212, 0.4);
  border: none;
  letter-spacing: 0.01em;
  text-align: center;
  min-width: 180px;
  width: 180px;
  position: relative;
  overflow: hidden;
}

.btn-primary:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 24px rgba(6, 182, 212, 0.5);
  background: linear-gradient(135deg, #0e7490 0%, #0891b2 100%);
}

.btn-primary:active {
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(6, 182, 212, 0.3);
}

.btn-secondary {
  background: white;
  color: #475569;
  padding: 1rem 2.5rem;
  border-radius: 0.75rem;
  text-decoration: none;
  font-weight: 600;
  font-size: 1rem;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  transition: all 0.3s ease;
  border: 2px solid #e2e8f0;
  letter-spacing: 0.01em;
  text-align: center;
  min-width: 180px;
  width: 180px;
}

.btn-secondary:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  border-color: #06b6d4;
  background: #f8fafc;
  color: #06b6d4;
}

.btn-secondary:active {
  transform: translateY(0);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

/* Challenge Section */
.challenge-section {
  margin-bottom: 4rem;
  padding: 1rem 0 3rem 0;
}

.challenge-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
}

.challenge-section h2 {
  text-align: center;
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 3rem;
  color: #1e293b;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.challenge-grid {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  gap: 3rem;
  align-items: stretch;
  max-width: 1200px;
  margin: 0 auto;
}

.challenge-card {
  background: white;
  padding: 2rem 2.5rem 0.5rem 2.5rem;
  border-radius: 16px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  border: none;
  position: relative;
  overflow: hidden;
  height: 100%;
  min-height: 320px;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

.solution-card {
  background: white;
  padding: 2rem 2.5rem 0.5rem 2.5rem;
  border-radius: 16px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  border: none;
  position: relative;
  overflow: hidden;
  height: 100%;
  min-height: 320px;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

.challenge-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(90deg, #0e7490, #0891b2);
}

.solution-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(90deg, #0891b2, #06b6d4);
}

.challenge-card:hover, .solution-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.12);
}

.challenge-card h3 {
  font-size: 1.4rem;
  font-weight: 700;
  margin-bottom: 1.5rem;
  color: #1e293b;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.solution-card h3 {
  font-size: 1.4rem;
  font-weight: 700;
  margin-bottom: 1.5rem;
  color: #1e293b;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.challenge-card ul, .solution-card ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.challenge-card li {
  display: flex;
  align-items: flex-start;
  gap: 1rem;
  margin-bottom: 0.8rem;
  line-height: 1.5;
  color: #475569;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  font-size: 0.95rem;
}

.solution-card li {
  display: flex;
  align-items: flex-start;
  gap: 1rem;
  margin-bottom: 0.8rem;
  line-height: 1.5;
  color: #475569;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  font-size: 0.95rem;
}

.challenge-card li:last-child, .solution-card li:last-child {
  margin-bottom: 0;
}

.challenge-icon, .solution-icon {
  flex-shrink: 0;
  width: 24px;
  height: 24px;
  border: 2px solid;
  border-radius: 6px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 2px;
}

.challenge-icon {
  border-color: #0e7490;
  color: #0e7490;
  background: rgba(14, 116, 144, 0.1);
}

.solution-icon {
  border-color: #06b6d4;
  color: #06b6d4;
  background: rgba(6, 182, 212, 0.1);
}

.challenge-icon svg, .solution-icon svg {
  width: 14px;
  height: 14px;
}

.arrow-container {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 1rem;
}

.arrow {
  width: 56px;
  height: 56px;
  background: linear-gradient(135deg, #0e7490, #0891b2);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  box-shadow: 0 6px 20px rgba(14, 116, 144, 0.3);
  animation: arrowPulse 2s ease-in-out infinite;
}

.arrow svg {
  width: 24px;
  height: 24px;
}

@keyframes arrowPulse {
  0%, 100% {
    transform: scale(1);
    box-shadow: 0 4px 12px rgba(14, 116, 144, 0.3);
  }
  ‌50% {
    transform: scale(1.05);
    box-shadow: 0 6px 16px rgba(14, 116, 144, 0.4);
  }
}







/* Publications Section */
.publications-section {
  margin-bottom: 4rem;
  margin-top: 9rem;
  padding: 1rem 0 3rem 0;
}

.publications-section h2 {
  text-align: center;
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 3rem;
  color: #1e293b;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.publications-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 3rem;
  max-width: 1000px;
  margin: 0 auto;
}

.publication-card {
  background: white;
  padding: 2rem;
  border-radius: 1rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  border: 1px solid #e2e8f0;
  cursor: pointer;
}

.publication-card h3 {
  font-size: 1.25rem;
  font-weight: 600;
  margin-bottom: 1rem;
  color: #1e293b;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.publication-card p {
  color: #475569;
  line-height: 1.6;
  margin-bottom: 1rem;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.journal {
  display: inline-block;
  background: #f1f5f9;
  color: #64748b;
  padding: 0.25rem 0.75rem;
  border-radius: 0.5rem;
  font-size: 0.875rem;
  font-weight: 500;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}





/* Video Section */
.video-section {
  margin-bottom: 4rem;
  margin-top: 2rem;
  padding: 1rem 0 3rem 0;
}

.video-section h2 {
  text-align: center;
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 3rem;
  color: #1e293b;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.video-description {
  text-align: center;
  font-size: 1.1rem;
  color: #64748b;
  margin-bottom: 2rem;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
  line-height: 1.6;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.video-container {
  max-width: 1000px;
  margin: 0 auto;
}

.video-container video {
  width: 100%;
  height: auto;
  border-radius: 1rem;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  object-fit: contain;
}

/* Workflow Subsection */
.workflow-subsection {
  margin-top: 0;
  padding: 2.5rem 0;
  border-radius: 16px;
  margin-left: -1rem;
  margin-right: -1rem;
  position: relative;
}



.workflow-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
}

/* Tab Navigation */
.workflow-tabs {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 2rem;
  flex-wrap: wrap;
}

.workflow-tab {
  padding: 0.6rem 1.2rem;
  background: white;
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  font-size: 0.85rem;
  font-weight: 600;
  color: #64748b;
  cursor: pointer;
  transition: all 0.3s ease;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  min-width: 140px;
  text-align: center;
}

.arrow-left-outer, .arrow-right-outer {
  display: flex;
  align-items: center;
  justify-content: center;
  color: #64748b;
  opacity: 0.6;
  transition: all 0.3s ease;
  width: 32px;
  height: 32px;
  cursor: pointer;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.8);
  border: 1px solid #e2e8f0;
}

.arrow-left-outer:hover, .arrow-right-outer:hover {
  opacity: 1;
  background: white;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transform: scale(1.05);
}

.arrow-left-outer svg, .arrow-right-outer svg {
  width: 16px;
  height: 16px;
}

.workflow-tab:hover {
  border-color: #06b6d4;
  color: #06b6d4;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(6, 182, 212, 0.2);
}

.workflow-tab.active {
  background: linear-gradient(135deg, #0891b2, #06b6d4);
  color: white;
  border-color: #06b6d4;
  box-shadow: 0 4px 12px rgba(6, 182, 212, 0.25);
}

/* Video and Text Layout */
.workflow-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2rem;
  background: white;
  border-radius: 16px;
  padding: 1.5rem;
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.08);
  overflow: hidden;
  min-height: 300px;
}

/* Left: Video Panel */
.workflow-video-panel {
  display: flex;
  flex-direction: column;
  height: 100%;
}

.workflow-video-panel video {
  width: 100%;
  height: 100%;
  border-radius: 12px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
  object-fit: cover;
}

/* Right: Text Panel */
.workflow-text-panel {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  height: 100%;
  position: relative;
}

.text-content {
  padding: 1rem 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.text-content h4 {
  font-size: 1.5rem;
  font-weight: 700;
  color: #1e293b;
  margin-bottom: 1.5rem;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  background: linear-gradient(135deg, #0891b2, #06b6d4);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.text-content p {
  font-size: 1rem;
  line-height: 1.7;
  color: #475569;
  margin-bottom: 2rem;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  flex: 1;
}

.try-it-btn {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  background: linear-gradient(135deg, #0891b2, #06b6d4);
  color: white;
  padding: 0.75rem 1.5rem;
  border-radius: 0.75rem;
  text-decoration: none;
  font-weight: 600;
  font-size: 0.95rem;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(6, 182, 212, 0.3);
  border: none;
  letter-spacing: 0.01em;
  margin-top: auto;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  min-width: 140px;
  justify-content: center;
  align-self: flex-start;
}

.try-it-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(6, 182, 212, 0.4);
  background: linear-gradient(135deg, #0e7490, #0891b2);
}

.try-it-btn:active {
  transform: translateY(0);
  box-shadow: 0 2px 8px rgba(6, 182, 212, 0.3);
}

.try-it-btn svg {
  width: 16px;
  height: 16px;
  transition: transform 0.3s ease;
}

.try-it-btn:hover svg {
  transform: translateX(2px) translateY(-2px);
}



/* Responsive Design */
@media (max-width: 768px) {
  .animated-background {
    height: 250px;
    margin: 1.5rem 0 3rem 0;
  }
  
  .input-image-container {
    left: 5%;
    transform: translateY(-50%) scale(0.6);
    width: 160px;
    height: 100px;
  }
  
  .ai-core {
    transform: translate(-50%, -50%) scale(0.6);
  }
  
  .picture1-container {
    right: 3%;
    transform: translateY(-50%) scale(0.6);
    width: 150px;
    height: 150px;
  }
  
  .ai-label {
    font-size: 9px;
}
  
  .hero-title {
    font-size: 2.5rem;
    white-space: normal;
    flex-direction: column;
  }
  
  .hero-subtitle {
    font-size: 1rem;
  }
  
  .stats-module {
    gap: 1.5rem;
  }
  
  .stat-number {
    font-size: 1.8rem;
  }
  
  .hero-actions {
    flex-direction: column;
    align-items: center;
    gap: 1rem;
  }
  
  .btn-primary,
  .btn-secondary {
    width: 100%;
    max-width: 300px;
    text-align: center;
  }
  
  .video-description {
    font-size: 1rem;
    padding: 0 1rem;
  }
  
  .challenge-grid {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
  
  .arrow-container {
    order: -1;
    margin: 1rem 0;
  }
  
  .arrow {
    transform: rotate(90deg);
  }
  
  .challenge-card, .solution-card {
    padding: 2rem;
  }
  
  .challenge-card li, .solution-card li {
    gap: 0.75rem;
  }
  
  .challenge-icon, .solution-icon {
    width: 20px;
    height: 20px;
  }
  
  .challenge-icon svg, .solution-icon svg {
    width: 12px;
    height: 12px;
  }
  
  .publications-grid {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  

  
  .workflow-subsection {
    margin-left: -0.5rem;
    margin-right: -0.5rem;
    padding: 2rem 0;
  }
  
  .workflow-tabs {
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
  }
  
  .workflow-tab {
    min-width: 200px;
    padding: 0.6rem 1rem;
    font-size: 0.8rem;
  }
  
  .arrow-left-outer, .arrow-right-outer {
    width: 28px;
    height: 28px;
  }
  
  .arrow-left-outer svg, .arrow-right-outer svg {
    width: 14px;
    height: 14px;
  }
  
  .workflow-content {
    grid-template-columns: 1fr;
    gap: 2rem;
    padding: 1.5rem;
  }
  
  .workflow-text-panel {
    order: -1;
  }
  
  .text-content h4 {
    font-size: 1.3rem;
  }
  
  .text-content p {
    font-size: 1rem;
  }
  

  
  .home-container {
    padding: 0 0.5rem;
  }
}
</style>