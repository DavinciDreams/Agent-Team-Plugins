---
name: seo-best-practices
description: SEO methodologies, keyword research techniques, and optimization strategies for search engine visibility
---

# SEO Best Practices

## Keyword Research Methods

### Keyword Types
- **Short-tail Keywords**: 1-2 words, high volume, high competition (e.g., "marketing")
- **Medium-tail Keywords**: 2-3 words, moderate volume, moderate competition (e.g., "digital marketing tips")
- **Long-tail Keywords**: 4+ words, lower volume, lower competition, higher intent (e.g., "digital marketing tips for small business")

### Research Process
1. **Seed Keywords**: Start with core terms related to your business
2. **Expand**: Use keyword tools to find related terms and variations
3. **Analyze Intent**: Determine search intent (informational, navigational, transactional, commercial)
4. **Evaluate Metrics**: Consider search volume, difficulty, and opportunity
5. **Prioritize**: Focus on keywords with best ROI for your goals

### Keyword Tools and Techniques
- **Competitor Analysis**: Review competitor keywords and rankings
- **Search Suggestions**: Use Google autocomplete and "People Also Ask"
- **Related Searches**: Check bottom of SERP for related queries
- **Question Keywords**: Target "how," "what," "why," "when," "where" queries
- **Local SEO**: Include location-based keywords for local businesses

## On-page SEO Checklist

### Title Tags
- **Length**: 50-60 characters optimal
- **Placement**: Primary keyword near the beginning
- **Format**: [Primary Keyword] | [Secondary Keyword] - [Brand Name]
- **Uniqueness**: Unique title for every page
- **Branding**: Include brand name for recognition

### Meta Descriptions
- **Length**: 150-160 characters optimal
- **Purpose**: Compelling description to improve CTR
- **Keywords**: Include primary keyword naturally
- **CTA**: Include call-to-action (Learn more, Get started, etc.)
- **Uniqueness**: Unique description for every page

### Header Structure
- **H1**: One per page, includes primary keyword, describes main topic
- **H2**: Section headings, includes secondary keywords, logical hierarchy
- **H3-H6**: Subsections, includes related keywords, maintains structure
- **Consistency**: Follow logical heading hierarchy throughout

### Content Optimization
- **Keyword Density**: 1-2% for primary keyword, natural placement
- **Semantic Keywords**: Include related terms and variations
- **Readability**: Flesch-Kincaid grade level 8-10 for general audiences
- **Content Length**: 300+ words minimum, 1000+ for competitive topics
- **Internal Links**: 2-4 internal links to relevant content
- **External Links**: 1-2 authoritative external sources

### Image SEO
- **File Names**: Descriptive, hyphen-separated names (e.g., "digital-marketing-strategy.jpg")
- **Alt Text**: Descriptive, includes keyword when appropriate, max 125 characters
- **File Size**: Compress to under 100KB for faster loading
- **Dimensions**: Use appropriate sizes for display (avoid scaling in HTML)
- **Captions**: Add captions for context and SEO benefit

## Meta Tags Optimization

### Essential Meta Tags
```html
<!-- Title Tag -->
<title>Primary Keyword | Secondary Keyword - Brand Name</title>

<!-- Meta Description -->
<meta name="description" content="Compelling description with keyword and CTA">

<!-- Canonical URL -->
<link rel="canonical" href="https://example.com/page">

<!-- Open Graph -->
<meta property="og:title" content="Page Title">
<meta property="og:description" content="Page Description">
<meta property="og:image" content="https://example.com/image.jpg">
<meta property="og:url" content="https://example.com/page">
<meta property="og:type" content="article">

<!-- Twitter Card -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Page Title">
<meta name="twitter:description" content="Page Description">
<meta name="twitter:image" content="https://example.com/image.jpg">

<!-- Viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Robots -->
<meta name="robots" content="index, follow">
```

### Schema Markup
- **Article Schema**: For blog posts and news articles
- **Product Schema**: For e-commerce product pages
- **Local Business Schema**: For local business listings
- **FAQ Schema**: For frequently asked questions
- **Review Schema**: For customer reviews and ratings
- **Breadcrumb Schema**: For navigation breadcrumbs

## Link Building Strategies

### Internal Linking
- **Content Hubs**: Create pillar pages linking to related content
- **Contextual Links**: Link within content where relevant
- **Anchor Text**: Use descriptive, keyword-rich anchor text
- **Link Depth**: Keep important content within 3 clicks from homepage
- **Orphan Pages**: Ensure all pages have internal links pointing to them

### External Linking
- **Authoritative Sources**: Link to high-quality, relevant websites
- **No-Follow**: Use rel="nofollow" for sponsored or untrusted links
- **Link Relevance**: Ensure external links are contextually relevant
- **Broken Links**: Regularly check for and fix broken external links

### Backlink Acquisition
- **Content Marketing**: Create link-worthy content (guides, studies, infographics)
- **Guest Posting**: Write articles for reputable industry publications
- **Digital PR**: Pitch stories to journalists and publications
- **Broken Link Building**: Find and replace broken links on relevant sites
- **HARO**: Respond to journalist queries for expert quotes
- **Resource Pages**: Get listed on relevant resource pages

### Link Quality Indicators
- **Domain Authority**: Higher DA indicates stronger authority
- **Relevance**: Links from relevant, industry-related sites
- **Placement**: Links within content are more valuable than footers/sidebars
- **Anchor Text**: Natural, varied anchor text is better than exact-match
- **Traffic**: Links from sites with real traffic are more valuable

## Technical SEO

### Site Speed
- **Page Load Time**: Target under 3 seconds
- **Image Optimization**: Compress and lazy-load images
- **Minification**: Minify CSS, JavaScript, and HTML
- **Caching**: Implement browser and server caching
- **CDN**: Use content delivery network for global performance

### Mobile Optimization
- **Responsive Design**: Ensure mobile-friendly layout
- **Mobile-First Indexing**: Google primarily uses mobile version for indexing
- **Touch Targets**: Buttons and links should be at least 48x48 pixels
- **Font Size**: Minimum 16px for body text on mobile
- **Viewport**: Properly configured viewport meta tag

### URL Structure
- **Clean URLs**: Use readable, hyphen-separated URLs
- **Keywords**: Include primary keyword in URL
- **Length**: Keep URLs under 100 characters
- **Lowercase**: Use lowercase letters consistently
- **Redirects**: Properly implement 301 redirects for URL changes

### XML Sitemap
- **Include**: All important pages in sitemap
- **Exclude**: No-index pages, duplicate content, low-value pages
- **Priority**: Set priority based on page importance (0.1-1.0)
- **Frequency**: Set changefreq based on update frequency
- **Submit**: Submit sitemap to Google Search Console and Bing Webmaster Tools
