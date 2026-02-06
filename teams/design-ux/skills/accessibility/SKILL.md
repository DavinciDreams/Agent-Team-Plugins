---
name: accessibility
description: WCAG 2.1 guidelines, screen reader compatibility, keyboard navigation, color contrast, semantic HTML, and ARIA attributes
---

# Accessibility

## WCAG 2.1 Guidelines and Compliance Levels

### WCAG Principles (POUR)
- **Perceivable**: Information and UI components must be presentable in ways users can perceive
- **Operable**: UI components and navigation must be operable
- **Understandable**: Information and operation of UI must be understandable
- **Robust**: Content must be robust enough to be interpreted by assistive technologies

### Compliance Levels
- **Level A**: Minimum level of accessibility
- **Level AA**: Standard level, required by many laws and regulations
- **Level AAA**: Highest level, rarely required but ideal

### WCAG 2.1 Success Criteria
- **1.1 Text Alternatives**: Provide text alternatives for non-text content
- **1.2 Time-Based Media**: Provide alternatives for time-based media
- **1.3 Adaptable**: Create content that can be presented in different ways
- **1.4 Distinguishable**: Make it easier to see and hear content
- **2.1 Keyboard Accessible**: Make all functionality available from a keyboard
- **2.2 Enough Time**: Provide users enough time to read and use content
- **2.3 Seizures and Physical Reactions**: Do not design content that causes seizures
- **2.4 Navigable**: Provide ways to help users navigate and find content
- **2.5 Input Modalities**: Make it easier to use inputs other than keyboard
- **3.1 Readable**: Make text content readable and understandable
- **3.2 Predictable**: Make Web pages appear and operate in predictable ways
- **3.3 Input Assistance**: Help users avoid and correct mistakes
- **4.1 Compatible**: Maximize compatibility with current and future user agents

## Screen Reader Compatibility

### Screen Reader Basics
- **Popular Screen Readers**: NVDA (Windows), JAWS (Windows), VoiceOver (Mac/iOS), TalkBack (Android)
- **Testing**: Test with multiple screen readers for comprehensive coverage
- **Semantic HTML**: Use proper HTML elements for screen reader compatibility
- **ARIA Attributes**: Use ARIA when HTML alone is insufficient
- **Focus Management**: Ensure logical focus order for keyboard and screen reader users

### Screen Reader Best Practices
- **Skip Links**: Provide skip links to jump to main content
- **Landmarks**: Use ARIA landmarks for page structure
- **Headings**: Use proper heading hierarchy (h1-h6)
- **Lists**: Use proper list elements for lists of items
- **Forms**: Use proper form labels and error messages
- **Images**: Provide meaningful alt text for images
- **Links**: Use descriptive link text, not "click here"
- **Buttons**: Use button elements for actions, link elements for navigation

### ARIA Landmarks
- **banner**: Header or navigation area
- **nav**: Navigation area
- **main**: Main content area
- **article**: Self-contained content
- **section**: Thematic grouping of content
- **aside**: Content tangentially related to main content
- **footer**: Footer area
- **search**: Search functionality
- **complementary**: Supporting content

## Keyboard Navigation

### Keyboard Navigation Fundamentals
- **Tab Order**: Logical tab order following visual layout
- **Focus Indicators**: Visible focus indicators on all interactive elements
- **Skip Links**: Allow users to skip navigation and jump to main content
- **Keyboard Shortcuts**: Provide keyboard shortcuts for common actions
- **Focus Management**: Manage focus appropriately for dynamic content

### Keyboard Navigation Best Practices
- **All Interactive Elements**: Make all buttons, links, and form elements keyboard accessible
- **Visible Focus**: Ensure focus is clearly visible
- **Logical Order**: Follow logical reading order
- **No Keyboard Traps**: Ensure users can navigate in and out of all areas
- **Escape Key**: Provide escape key to close modals and menus
- **Enter/Space**: Use Enter or Space to activate buttons and links
- **Arrow Keys**: Use arrow keys for navigation within components

### Focus Management
- **Initial Focus**: Set initial focus when opening dialogs or modals
- **Focus Restoration**: Restore focus when closing dialogs or modals
- **Focus Trapping**: Trap focus within modals and dialogs
- **Auto-focus**: Use auto-focus sparingly and only when appropriate
- **Focus Visible**: Ensure focus is always visible

## Color Contrast and Visual Accessibility

### Color Contrast Requirements
- **Normal Text**: 4.5:1 contrast ratio (Level AA)
- **Large Text**: 3:1 contrast ratio (Level AA, 18pt+ or 14pt+ bold)
- **Graphical Objects**: 3:1 contrast ratio (Level AA)
- **Enhanced Contrast**: 7:1 for normal text, 4.5:1 for large text (Level AAA)

### Color Contrast Best Practices
- **Test Contrast**: Use contrast checking tools to verify compliance
- **Don't Rely on Color Alone**: Use patterns, shapes, or labels in addition to color
- **Color Blindness**: Consider color blind users when choosing palettes
- **Dark Mode**: Ensure contrast ratios work in both light and dark modes
- **Text Over Images**: Ensure text over images has sufficient contrast

### Visual Accessibility
- **Text Scaling**: Support text scaling up to 200% without breaking layout
- **Responsive Design**: Ensure content works at all viewport sizes
- **Touch Targets**: Minimum 44x44 pixels for touch targets
- **Spacing**: Provide adequate spacing between interactive elements
- **Motion**: Respect prefers-reduced-motion preference

## Semantic HTML

### Semantic HTML Elements
- **headings**: h1-h6 for document structure
- **nav**: Navigation sections
- **main**: Main content area
- **article**: Self-contained content
- **section**: Thematic sections
- **aside**: Tangentially related content
- **header**: Header or introductory content
- **footer**: Footer or concluding content
- **figure**: Self-contained content with caption
- **figcaption**: Caption for figure element

### Semantic HTML Best Practices
- **Use Proper Elements**: Choose the most semantic element for the content
- **Heading Hierarchy**: Use headings in proper hierarchical order
- **Lists**: Use ul, ol, and dl for lists
- **Forms**: Use proper form elements with labels
- **Tables**: Use proper table elements with headers
- **Links vs Buttons**: Use links for navigation, buttons for actions

### Forms Accessibility
- **Labels**: Associate labels with form inputs using for/id or aria-label
- **Required Fields**: Indicate required fields with aria-required
- **Error Messages**: Associate error messages with inputs using aria-describedby
- **Instructions**: Provide clear instructions for complex inputs
- **Validation**: Provide real-time validation feedback
- **Success Messages**: Confirm successful form submission

## ARIA Attributes

### ARIA Roles
- **role="button"**: Use when a non-button element functions as a button
- **role="link"**: Use when a non-link element functions as a link
- **role="dialog"**: Use for modal dialogs
- **role="alert"**: Use for important alerts
- **role="status"**: Use for status messages
- **role="progressbar"**: Use for progress indicators
- **role="tablist"**: Use for tab containers
- **role="tab"**: Use for individual tabs
- **role="tabpanel"**: Use for tab panels

### ARIA States and Properties
- **aria-label**: Provide accessible label for elements without visible text
- **aria-labelledby**: Reference another element as the label
- **aria-describedby**: Reference another element as description
- **aria-expanded**: Indicate expanded/collapsed state
- **aria-selected**: Indicate selected state
- **aria-checked**: Indicate checked state
- **aria-disabled**: Indicate disabled state
- **aria-hidden**: Hide elements from screen readers
- **aria-live**: Indicate live region for dynamic content
- **aria-atomic**: Indicate if entire region should be announced

### ARIA Best Practices
- **Use HTML First**: Use semantic HTML before adding ARIA
- **Don't Overuse**: Only use ARIA when HTML is insufficient
- **Test Thoroughly**: Test with screen readers to ensure ARIA works correctly
- **Keep Updated**: Keep ARIA attributes in sync with visual state
- **Document**: Document ARIA usage for maintainability

## Accessibility Testing Tools and Methods

### Automated Testing Tools
- **axe DevTools**: Browser extension for automated accessibility testing
- **WAVE**: Web Accessibility Evaluation Tool
- **Lighthouse**: Chrome DevTools accessibility audit
- **Pa11y**: Automated accessibility testing tool
- **Siteimprove**: Enterprise accessibility platform

### Manual Testing Methods
- **Keyboard Navigation**: Test all functionality with keyboard only
- **Screen Reader Testing**: Test with NVDA, JAWS, VoiceOver, or TalkBack
- **Zoom Testing**: Test at 200% zoom level
- **Color Contrast Testing**: Verify contrast ratios with tools
- **Voice Control**: Test with voice control software

### User Testing
- **Include Users with Disabilities**: Include users with disabilities in testing
- **Assistive Technology**: Test with users' preferred assistive technology
- **Real-World Scenarios**: Test real-world use cases
- **Feedback**: Gather feedback from users with disabilities

### Accessibility Checklist
- [ ] All images have alt text
- [ ] Color contrast meets WCAG AA standards
- [ ] All functionality is keyboard accessible
- [ ] Focus indicators are visible
- [ ] Form inputs have associated labels
- [ ] Error messages are clear and associated with inputs
- [ ] Heading hierarchy is logical
- [ ] Links have descriptive text
- [ ] Tables have proper headers
- [ ] Dynamic content is announced to screen readers
- [ ] Skip links are provided
- [ ] ARIA landmarks are used appropriately
- [ ] Motion respects user preferences
- [ ] Text scales up to 200% without breaking
- [ ] Touch targets are at least 44x44 pixels
