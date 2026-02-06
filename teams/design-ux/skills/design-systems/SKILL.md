---
name: design-systems
description: Design system principles, component libraries, typography, color theory, spacing systems, and design tokens
---

# Design Systems

## Design System Principles

### Core Principles
- **Consistency**: Ensure consistent visual language and behavior across all products
- **Scalability**: Design systems that grow with the product and team
- **Efficiency**: Speed up design and development through reusable components
- **Accessibility**: Build accessibility into every component from the start
- **Maintainability**: Create systems that are easy to update and maintain
- **Documentation**: Document everything thoroughly for clear adoption

### Design System Structure
- **Foundations**: Colors, typography, spacing, icons, elevation
- **Components**: Reusable UI elements with documented variations
- **Patterns**: Common solutions to recurring design problems
- **Templates**: Page layouts and screen structures
- **Guidelines**: Usage rules and best practices
- **Resources**: Assets, downloads, and implementation guides

## Component Libraries

### Popular Component Libraries
- **Material Design**: Google's design system with comprehensive components
- **Ant Design**: Enterprise-class UI design language and React components
- **Tailwind CSS**: Utility-first CSS framework with design tokens
- **shadcn/ui**: Beautiful, accessible components built with Radix UI and Tailwind
- **Chakra UI**: Simple, modular and accessible component library
- **MUI**: React components that implement Google's Material Design

### Component Design Principles
- **Single Responsibility**: Each component should have one clear purpose
- **Composability**: Components should be composable and flexible
- **Predictable Behavior**: Components should behave consistently
- **Accessible**: All components must meet WCAG AA standards
- **Responsive**: Components must work across all device sizes
- **Documented**: Each component has clear documentation and examples

### Component States
- **Default**: Normal state of the component
- **Hover**: When user hovers over the component
- **Focus**: When component has keyboard focus
- **Active**: When component is being activated
- **Disabled**: When component is not available
- **Loading**: When component is in a loading state
- **Error**: When component has an error state

## Typography

### Typography Fundamentals
- **Font Families**: Choose font families that are readable and on-brand
- **Font Weights**: Use a limited number of weights (regular, medium, bold)
- **Font Sizes**: Establish a type scale with consistent ratios
- **Line Height**: Use appropriate line height for readability (1.4-1.6)
- **Letter Spacing**: Adjust letter spacing for headings and uppercase text
- **Text Alignment**: Left-align for body text, center for short headings

### Type Scale
- **Modular Scale**: Use a mathematical scale for consistent sizing
- **Common Ratios**: Major third (1.25), Perfect fourth (1.33), Golden ratio (1.618)
- **Responsive Typography**: Scale text size based on viewport width
- **Clamp Function**: Use CSS clamp() for fluid typography
- **Text Scaling**: Support text scaling up to 200% for accessibility

### Typography Hierarchy
- **H1**: Main page title, largest size
- **H2**: Section headings
- **H3**: Subsection headings
- **H4-H6**: Minor headings
- **Body**: Main content text
- **Caption**: Supporting text, labels
- **Overline**: Category labels, small uppercase text

## Color Theory

### Color Fundamentals
- **Primary Color**: Main brand color, used for primary actions
- **Secondary Color**: Supporting brand color, used for accents
- **Neutral Colors**: Grays for text, backgrounds, borders
- **Semantic Colors**: Success, warning, error, info colors
- **Color Palettes**: Create shades and tints of each color
- **Color Contrast**: Ensure WCAG AA compliance (4.5:1 for normal text)

### Color Systems
- **HSL**: Hue, Saturation, Lightness - easier for designers to work with
- **RGB**: Red, Green, Blue - used for digital displays
- **HEX**: Hexadecimal - common in web design
- **Design Tokens**: Store colors as tokens for consistency
- **Dark Mode**: Create dark mode variants of all colors

### Color Usage Guidelines
- **60-30-10 Rule**: 60% neutral, 30% primary, 10% accent
- **Limit Palette**: Use 5-7 colors maximum for clarity
- **Meaningful Colors**: Use color to convey meaning consistently
- **Accessibility First**: Ensure all color combinations meet contrast requirements
- **Color Blindness**: Consider color blind users when choosing palettes

## Spacing Systems

### Spacing Fundamentals
- **Spacing Scale**: Use a consistent scale (4px, 8px, 16px, 24px, 32px, 48px, 64px)
- **4px Base Grid**: Use 4px as the base unit for spacing
- **Consistent Application**: Apply spacing consistently across components
- **Responsive Spacing**: Adjust spacing for different screen sizes
- **Whitespace**: Use whitespace effectively to improve readability

### Spacing Types
- **Padding**: Space inside elements
- **Margin**: Space outside elements
- **Gap**: Space between flex/grid items
- **Inset**: Shorthand for top, right, bottom, left spacing

## Icon Systems

### Icon Fundamentals
- **Icon Style**: Choose a consistent icon style (outline, filled, duotone)
- **Icon Size**: Establish standard sizes (16px, 24px, 32px, 48px)
- **Icon Library**: Use an established icon library (Material Icons, Lucide, Heroicons)
- **Custom Icons**: Create custom icons when needed, maintain consistency
- **Accessibility**: Include aria-label or aria-hidden for icons

### Icon Guidelines
- **Meaningful**: Icons should be universally understood
- **Simple**: Keep icons simple and clear
- **Consistent**: Use consistent stroke width and style
- **Scalable**: Icons should look good at all sizes
- **Labeled**: Always provide text labels for icons

## Illustration Guidelines

### Illustration Style
- **Consistent Style**: Maintain consistent illustration style across all illustrations
- **Color Palette**: Use brand colors for illustrations
- **Purpose**: Use illustrations to support content, not decorate
- **Accessibility**: Ensure illustrations don't distract from content
- **Loading States**: Use illustrations for empty and loading states

## Design Tokens

### Token Fundamentals
- **Naming Convention**: Use clear, descriptive names (color-primary-500)
- **Categories**: Organize tokens by category (color, spacing, typography)
- **Aliases**: Create aliases for semantic tokens (color-text-primary)
- **Platform Support**: Support multiple platforms (web, iOS, Android)
- **Documentation**: Document all tokens with examples

### Token Types
- **Color Tokens**: Colors for backgrounds, text, borders, etc.
- **Spacing Tokens**: Padding, margin, gap values
- **Typography Tokens**: Font families, sizes, weights, line heights
- **Border Radius Tokens**: Rounded corner values
- **Shadow Tokens**: Elevation and shadow values
- **Animation Tokens**: Duration, easing, delay values

## Design System Documentation

### Documentation Structure
- **Overview**: Introduction to the design system
- **Foundations**: Colors, typography, spacing, icons
- **Components**: Each component with examples and guidelines
- **Patterns**: Common design patterns and solutions
- **Guidelines**: Usage rules and best practices
- **Resources**: Downloads, assets, and implementation guides

### Documentation Best Practices
- **Live Examples**: Show live, interactive examples
- **Code Snippets**: Provide code for each component
- **Do's and Don'ts**: Show correct and incorrect usage
- **Accessibility Notes**: Include accessibility requirements
- **Changelog**: Track changes and updates
- **Versioning**: Use semantic versioning for releases
