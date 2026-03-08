module ApplicationHelper
  TAG_COLORS = %w[purple blue green amber rose teal orange indigo]
  CATEGORY_COLORS = %w[violet sky emerald amber fuchsia cyan lime slate]

  def tag_color_class(tag_name)
    index = tag_name.bytes.sum % TAG_COLORS.size
    "tag-#{TAG_COLORS[index]}"
  end

  def category_color_class(category_name)
    index = category_name.bytes.sum % CATEGORY_COLORS.size
    "cat-#{CATEGORY_COLORS[index]}"
  end

  # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
  def category_icon(name, size: 16)
    svg = case name.downcase
    when "ubrania", "clothing"
      %(<path d="M8 2a3 3 0 0 0-3 3h2a1 1 0 1 1 2 0h2a3 3 0 0 0-3-3zM3 6l-1 8h12l-1-8H3z" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linecap="round" stroke-linejoin="round"/>)
    when "kosmetyki", "toiletries"
      %(<path d="M6 2h4v3H6zM5 5h6v1a1 1 0 0 1-1 1H6a1 1 0 0 1-1-1V5zM6 7h4v5a2 2 0 0 1-2 2h0a2 2 0 0 1-2-2V7z" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linecap="round" stroke-linejoin="round"/>)
    when "elektronika", "electronics"
      %(<rect x="2" y="3" width="12" height="8" rx="1" stroke="currentColor" stroke-width="1.2" fill="none"/><path d="M5 14h6M8 11v3" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/>)
    when "dokumenty", "documents"
      %(<path d="M4 2h5l3 3v9H4V2z" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linejoin="round"/><path d="M9 2v3h3" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linejoin="round"/><path d="M6 8h4M6 10h3" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/>)
    when "akcesoria", "accessories"
      %(<circle cx="8" cy="6" r="4" stroke="currentColor" stroke-width="1.2" fill="none"/><path d="M4 6c0 2.2 1.8 4 4 4s4-1.8 4-4" stroke="currentColor" stroke-width="1.2" fill="none"/><path d="M6 14h4M7 10v4M9 10v4" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/>)
    when "obuwie", "footwear"
      %(<path d="M3 10V6a2 2 0 0 1 2-2h1l1 2h2l1-2h1a2 2 0 0 1 2 2v4H3z" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linejoin="round"/><path d="M2 10h12v2H2z" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linejoin="round"/>)
    when "jedzenie", "food"
      %(<path d="M8 2v4M6 2v2a2 2 0 0 0 4 0V2" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linecap="round"/><path d="M8 6v8M6 14h4" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/>)
    when /sprz[eę]t/, "gear"
      %(<circle cx="8" cy="8" r="3" stroke="currentColor" stroke-width="1.2" fill="none"/><circle cx="8" cy="8" r="1" fill="currentColor"/><path d="M8 2v2M8 12v2M2 8h2M12 8h2M3.8 3.8l1.4 1.4M10.8 10.8l1.4 1.4M12.2 3.8l-1.4 1.4M5.2 10.8l-1.4 1.4" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/>)
    else
      %(<circle cx="8" cy="8" r="5" stroke="currentColor" stroke-width="1.2" fill="none"/><circle cx="8" cy="8" r="1.5" fill="currentColor"/>)
    end

    %(<svg width="#{size}" height="#{size}" viewBox="0 0 16 16" fill="none" class="resource-icon">#{svg}</svg>).html_safe
  end

  def tag_icon(name, size: 14)
    svg = case name.downcase
    when /pla[żz]a/, "beach"
      %(<path d="M2 12h12M4 12c0-3 1.5-5 4-5s4 2 4 5" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linecap="round"/><circle cx="12" cy="3" r="2" stroke="currentColor" stroke-width="1.2" fill="none"/>)
    when "miasto", "city"
      %(<path d="M2 14V6h4v8M6 14V3h4v11M10 14V6h4v8" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linejoin="round"/><path d="M4 8h0M4 10h0M8 5h0M8 7h0M8 9h0M8 11h0M12 8h0M12 10h0" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>)
    when /g[oó]ry/, "hiking", "mountains"
      %(<path d="M2 13l4-8 3 4 2-2 3 6H2z" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linejoin="round"/>)
    when "zima", "winter"
      %(<path d="M8 2v12M4 4l8 8M12 4l-8 8M5 8h6" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/>)
    when "lato", "summer"
      %(<circle cx="8" cy="8" r="3" stroke="currentColor" stroke-width="1.2" fill="none"/><path d="M8 2v2M8 12v2M2 8h2M12 8h2M4 4l1.5 1.5M10.5 10.5L12 12M12 4l-1.5 1.5M5.5 10.5L4 12" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/>)
    when "camping"
      %(<path d="M8 3L2 13h12L8 3z" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linejoin="round"/><path d="M8 3v10M6 13l2-4 2 4" stroke="currentColor" stroke-width="1.2" stroke-linejoin="round"/>)
    when "biznes", "business"
      %(<rect x="3" y="6" width="10" height="7" rx="1" stroke="currentColor" stroke-width="1.2" fill="none"/><path d="M6 6V4a2 2 0 0 1 4 0v2" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linecap="round"/>)
    when "weekend"
      %(<circle cx="8" cy="8" r="6" stroke="currentColor" stroke-width="1.2" fill="none"/><path d="M8 4v4l3 2" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>)
    when /d[lł]ugi wyjazd/, "long trip"
      %(<circle cx="8" cy="7" r="5" stroke="currentColor" stroke-width="1.2" fill="none"/><path d="M8 4v3l2 1" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/><path d="M5 13h6" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/>)
    when "deszcz", "rain", "rainy"
      %(<path d="M4 8a4 4 0 1 1 8 0" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linecap="round"/><path d="M5 11l-1 2M8 11l-1 2M11 11l-1 2" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/>)
    when "elegancko", "formal"
      %(<path d="M6 2l-2 5h2v7h4V7h2L10 2H6z" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linejoin="round"/><path d="M8 5v2" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/>)
    else
      %(<path d="M8 2l1.5 3H13l-2.5 2 1 3.5L8 8.5 4.5 10.5l1-3.5L3 5h3.5z" stroke="currentColor" stroke-width="1.2" fill="none" stroke-linejoin="round"/>)
    end

    %(<svg width="#{size}" height="#{size}" viewBox="0 0 16 16" fill="none" class="resource-icon">#{svg}</svg>).html_safe
  end
  # rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity
end
