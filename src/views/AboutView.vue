<template>
  <div>
    <h1>About EPCOT</h1>

    <div class="gray-box">
      <p class="intro-text">
        EPCOT employs a pre-training and fine-tuning framework to systematically learn the complex regulatory code connecting DNA sequence and chromatin accessibility to genome-wide function. By pre-training on hundreds of epigenomic features, the framework learns robust and generalizable sequence representations. This foundational approach establishes a versatile in-silico mapper, capable of translating simple, cost-effective inputs (ATAC-seq and DNA sequence) into accurate, cell-type-specific predictions for a wide range of complex modalities, including transcription, 3D chromatin organization, and enhancer activity, even in previously unseen cell types.
      </p>
    </div>

    <h2 class="section-title">Key Components of EPCOT</h2>

    <!-- EPCOT Block -->
    <div class="component-box">
      <div class="image-container">
        <img src="../../public/images/graphical_abstract_epcot1.png" alt="EPCOT Framework">
      </div>
      <div class="text-container">
        <h3>EPCOT: A Foundational Framework for Genomic Prediction</h3>

        <p>
          EPCOT employs a pre-training and fine-tuning framework to systematically learn the complex regulatory code connecting DNA sequence and chromatin accessibility to genome-wide function. By pre-training on hundreds of epigenomic features, the framework learns robust and generalizable sequence representations.
        </p>
        
        <p>
          This foundational approach establishes a versatile in-silico mapper, capable of translating simple, cost-effective inputs (ATAC-seq and DNA sequence) into accurate, cell-type-specific predictions for a wide range of complex modalities, including transcription, 3D chromatin organization, and enhancer activity, even in previously unseen cell types.
        </p>
      </div>
    </div>

    <!-- EPCOTv2 Block -->
    <div class="component-box">
      <div class="image-container">
        <img src="../../public/images/figure_1a_epcotv2.png" alt="EPCOTv2 Architecture">
      </div>
      <div class="text-container">
        <h3>EPCOTv2: A General-Purpose Genomic AI Model</h3>

        <p>
          Built on this foundation, EPCOTv2 features a general-purpose, multi-task AI architecture that integrates an even broader spectrum of genomic knowledge into a single, unified model.
        </p>
        
        <p>
          Unlike traditional solutions that require separate models for each task, EPCOTv2 can jointly predict diverse and advanced modalities—from nascent RNA transcription and functional variant effects to ultra-resolution chromatin contacts—across different tissues and species. This allows it to perform complex applications like cross-species transfer learning (human to mouse) and eQTL prioritization in novel cellular contexts, all without task-specific tuning.
        </p>
      </div>
    </div>

    <!-- Availability Section -->
    <h2 class="section-title">Availability and Resources</h2>

    <div class="availability-section">
      <p class="outro-paragraph">
        We believe in collaborative development and invite scientists and developers to explore, contribute, and help
        shape the future of genomic prediction. The models, source code, and tutorials are publicly available.
      </p>
      <div class="button-group left-align">
        <button>Try Online</button>
        <button>View Source Code</button>
        <button>Read the Paper</button>
      </div>
    </div>
  </div>
</template>

<style scoped>
body {
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  color: #333;
  line-height: 1.6;
}

h1 {
  text-align: center;
  font-size: 2.5em;
  margin-bottom: 20px;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.section-title {
  font-size: 1.8em;
  font-weight: 600;
  margin-top: 60px;
  margin-bottom: 30px;
  text-align: left;
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.gray-box {
  background-color: #f8fafc;
  padding: 40px;
  border-radius: 12px;
  max-width: 1200px;
  margin: 0 auto 60px auto;
  text-align: left;
  border: 1px solid #e2e8f0;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.03);
}

.intro-text {
  font-size: 1em;
  color: #555;
  text-align: left;
  line-height: 1.6;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  font-weight: 400;
  margin-bottom: 1em;
}

.component-box {
  display: flex;
  flex-direction: row;
  align-items: center; /* Key setting: vertically center images with text */
  max-width: 1200px;
  margin: 60px auto;
  gap: 80px;
}


.image-container {
  flex: 1;
  text-align: center;
}

.image-container img {
  width: 100%;
  height: auto;
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 10px;
}

.text-container {
  flex: 1.1;
  font-size: 0.95em;
  color: #444;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  font-weight: 400;
  line-height: 1.6;
}

.text-container p {
  margin-bottom: 1em;
}

.text-container ul {
  padding-left: 20px;
  margin-top: 0.4em;
  margin-bottom: 1em;
}

h3 {
  font-size: 1.3em;
  margin-bottom: 1.2em;
  margin-top: 0.5em;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  font-weight: 600;
  color: #1e293b;
}

.availability-section {
  max-width: 1200px;
  margin: 0 auto 40px auto;
  text-align: left;
}

.outro-paragraph {
  font-size: 0.95em;
  color: #555;
  margin-bottom: 2rem;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  font-weight: 400;
  line-height: 1.6;
}

.button-group.left-align {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
}

.button-group.left-align button {
  font-size: 0.95em;
  padding: 12px 24px;
  border-radius: 8px;
  background: linear-gradient(135deg, #1e40af 0%, #3b82f6 100%);
  color: white;
  border: none;
  transition: all 0.3s ease;
  cursor: pointer;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  font-weight: 400;
  box-shadow: 0 2px 4px rgba(30, 64, 175, 0.2);
}

.button-group.left-align button:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(30, 64, 175, 0.3);
  background: linear-gradient(135deg, #1d4ed8 0%, #2563eb 100%);
}

.button-group.left-align button:nth-child(2),
.button-group.left-align button:nth-child(3) {
  background: white;
  color: #475569;
  border: 2px solid #e2e8f0;
  box-shadow: none;
}

.button-group.left-align button:nth-child(2):hover,
.button-group.left-align button:nth-child(3):hover {
  background: #f8fafc;
  color: #3b82f6;
  border-color: #3b82f6;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}
</style>
