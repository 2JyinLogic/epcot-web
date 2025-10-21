<template>
  <footer class="footer">
    <div class="footer-content">
      <!-- Left Column: Brand Section -->
      <div class="brand-section">
        <div class="brand-logo">
          <img src="/images/logo.png" alt="EPCOT Logo" class="footer-logo" />
          <span class="brand-name">EPCOT</span>
        </div>
        <p class="brand-tagline">A unified multi-task AI model for predicting genomic modalities from DNA sequences and chromatin accessibility</p>
      </div>

      <!-- Middle Column: Quick Links -->
      <div class="links-section">
        <h3>Quick Links</h3>
        <div class="links-grid">
          <a href="https://www.biorxiv.org/content/10.1101/2025.05.08.652986v1" target="_blank" class="link-item">Paper</a>
          <a href="https://github.com/liu-bioinfo-lab/general_AI_model" target="_blank" class="link-item">GitHub</a>
          <a href="https://colab.research.google.com/github/liu-bioinfo-lab/general_AI_model/blob/main/epcotv2_basic_tutorial.ipynb" target="_blank" class="link-item">Colab Tutorial</a>
          <a href="https://huggingface.co/spaces/drjieliu/EPCOTv2-app" target="_blank" class="link-item">Try web version</a>
        </div>
      </div>

      <!-- Right Column: Contact Section -->
      <div class="contact-section">
        <h3>Contact us</h3>
        <div class="contact-info">
          <div class="email-text">drjieliu@umich.edu</div>
          <a href="https://jieliu6.github.io/" target="_blank" rel="noopener noreferrer" class="link-item">Liu Lab</a>
        </div>
      </div>
    </div>

    <!-- Bottom Copyright Section -->
    <div class="copyright-section">
      <p>© 2025 Liu Lab, Department of Computational Medicine and Bioinformatics, University of Michigan</p>
    </div>
  </footer>
</template>

<script setup lang="ts">
// No methods needed since we removed the buttons
</script>

<style scoped>
.footer {
  width: 100vw;
  margin-left: calc(-50vw + 50%);
  background: #234274;;
  color: #fff;
  padding: 2rem 2rem 0.5rem 2rem;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  position: relative;
  box-sizing: border-box;
  min-height: 200px;
}

.footer-content {
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 3rem;
  align-items: start;
  margin-bottom: 1.5rem;
}

/* Left Column: Brand Section */
.brand-section {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.brand-logo {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.5rem;
}

.footer-logo {
  height: 40px;
  width: auto;
  object-fit: contain;
  display: block;
}

.brand-name {
  font-size: 1.5rem;
  font-weight: 700;
  color: #fff;
  letter-spacing: 0.5px;
}

.brand-tagline {
  margin: 0;
  font-size: 0.95rem;
  color: #cbd5e1;
  line-height: 1.5;
  max-width: 280px;
}

/* Middle Column: Quick Links */
.links-section h3 {
  margin: 0 0 1.5rem 0;
  font-size: 1.1rem;
  font-weight: 700;
  color: #fff;
  text-transform: none;
  letter-spacing: 0.3px;
}

.links-grid {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.link-item {
  color: #cbd5e1;
  text-decoration: none;
  font-size: 0.95rem;
  font-weight: 400;
  transition: all 0.3s ease;
  padding: 0.25rem 0;
  line-height: 1.4;
}

.link-item:hover {
  color: #ffffff;
  transform: translateX(4px);
}

/* Right Column: Contact Section */
.contact-section h3 {
  margin: 0 0 1.5rem 0;
  font-size: 1.1rem;
  font-weight: 700;
  color: #fff;
  text-transform: none;
  letter-spacing: 0.3px;
}

.contact-info {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.email-item {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  color: #cbd5e1;
  font-size: 0.95rem;
}

.email-icon {
  font-size: 1rem;
  color: #9ca3af;
}

.email-text {
  font-weight: 400;
}

.contact-button {
  background: #1c84cd;
  color: white;
  border: none;
  border-radius: 8px;
  padding: 0.75rem 1.5rem;
  font-size: 0.95rem;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  gap: 0.5rem;
  width: fit-content;
  box-shadow: 0 2px 8px rgba(6, 182, 212, 0.3);
}

.contact-button:hover {
  background: #1c84cd;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(6, 182, 212, 0.4);
}

.button-icon {
  font-size: 0.9rem;
}

/* Bottom Copyright Section */
.copyright-section {
  max-width: 1200px;
  margin: 0 auto;
  padding-top: 1rem;
  border-top: 1px solid #b3bdcc;
  text-align: center;
}

.copyright-section p {
  margin: 0;
  font-size: 0.9rem;
  color: #9ca3af;
  font-weight: 400;
}

/* Responsive Design */
@media (max-width: 1024px) {
  .footer-content {
    gap: 2.5rem;
  }
}

@media (max-width: 768px) {
  .footer {
    padding: 1.5rem 1.5rem 0.5rem 1.5rem;
  }
  
  .footer-content {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  
  .brand-tagline {
    max-width: none;
  }
  
  .contact-button {
    width: 100%;
    justify-content: center;
  }
  
  .footer-logo {
    height: 35px;
  }
  
  .brand-logo {
    gap: 0.4rem;
  }
}

@media (max-width: 480px) {
  .footer {
    padding: 1.25rem 1rem 0.5rem 1rem;
  }
  
  .footer-content {
    gap: 1.5rem;
  }
  
  .brand-logo {
    gap: 0.3rem;
  }
  
  .footer-logo {
    height: 30px;
  }
  
  .brand-name {
    font-size: 1.3rem;
  }
}
</style>
