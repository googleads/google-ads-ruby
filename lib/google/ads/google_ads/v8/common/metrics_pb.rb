# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/common/metrics.proto

require 'google/protobuf'

require 'google/ads/google_ads/v8/enums/interaction_event_type_pb'
require 'google/ads/google_ads/v8/enums/quality_score_bucket_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/common/metrics.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.common.Metrics" do
      proto3_optional :absolute_top_impression_percentage, :double, 183
      proto3_optional :active_view_cpm, :double, 184
      proto3_optional :active_view_ctr, :double, 185
      proto3_optional :active_view_impressions, :int64, 186
      proto3_optional :active_view_measurability, :double, 187
      proto3_optional :active_view_measurable_cost_micros, :int64, 188
      proto3_optional :active_view_measurable_impressions, :int64, 189
      proto3_optional :active_view_viewability, :double, 190
      proto3_optional :all_conversions_from_interactions_rate, :double, 191
      proto3_optional :all_conversions_value, :double, 192
      optional :all_conversions_value_by_conversion_date, :double, 240
      proto3_optional :all_conversions, :double, 193
      optional :all_conversions_by_conversion_date, :double, 241
      proto3_optional :all_conversions_value_per_cost, :double, 194
      proto3_optional :all_conversions_from_click_to_call, :double, 195
      proto3_optional :all_conversions_from_directions, :double, 196
      proto3_optional :all_conversions_from_interactions_value_per_interaction, :double, 197
      proto3_optional :all_conversions_from_menu, :double, 198
      proto3_optional :all_conversions_from_order, :double, 199
      proto3_optional :all_conversions_from_other_engagement, :double, 200
      proto3_optional :all_conversions_from_store_visit, :double, 201
      proto3_optional :all_conversions_from_store_website, :double, 202
      proto3_optional :average_cost, :double, 203
      proto3_optional :average_cpc, :double, 204
      proto3_optional :average_cpe, :double, 205
      proto3_optional :average_cpm, :double, 206
      proto3_optional :average_cpv, :double, 207
      proto3_optional :average_page_views, :double, 208
      proto3_optional :average_time_on_site, :double, 209
      proto3_optional :benchmark_average_max_cpc, :double, 210
      proto3_optional :benchmark_ctr, :double, 211
      proto3_optional :bounce_rate, :double, 212
      proto3_optional :clicks, :int64, 131
      proto3_optional :combined_clicks, :int64, 156
      proto3_optional :combined_clicks_per_query, :double, 157
      proto3_optional :combined_queries, :int64, 158
      proto3_optional :content_budget_lost_impression_share, :double, 159
      proto3_optional :content_impression_share, :double, 160
      proto3_optional :conversion_last_received_request_date_time, :string, 161
      proto3_optional :conversion_last_conversion_date, :string, 162
      proto3_optional :content_rank_lost_impression_share, :double, 163
      proto3_optional :conversions_from_interactions_rate, :double, 164
      proto3_optional :conversions_value, :double, 165
      optional :conversions_value_by_conversion_date, :double, 242
      proto3_optional :conversions_value_per_cost, :double, 166
      proto3_optional :conversions_from_interactions_value_per_interaction, :double, 167
      proto3_optional :conversions, :double, 168
      optional :conversions_by_conversion_date, :double, 243
      proto3_optional :cost_micros, :int64, 169
      proto3_optional :cost_per_all_conversions, :double, 170
      proto3_optional :cost_per_conversion, :double, 171
      proto3_optional :cost_per_current_model_attributed_conversion, :double, 172
      proto3_optional :cross_device_conversions, :double, 173
      proto3_optional :ctr, :double, 174
      proto3_optional :current_model_attributed_conversions, :double, 175
      proto3_optional :current_model_attributed_conversions_from_interactions_rate, :double, 176
      proto3_optional :current_model_attributed_conversions_from_interactions_value_per_interaction, :double, 177
      proto3_optional :current_model_attributed_conversions_value, :double, 178
      proto3_optional :current_model_attributed_conversions_value_per_cost, :double, 179
      proto3_optional :engagement_rate, :double, 180
      proto3_optional :engagements, :int64, 181
      proto3_optional :hotel_average_lead_value_micros, :double, 213
      proto3_optional :hotel_price_difference_percentage, :double, 214
      proto3_optional :hotel_eligible_impressions, :int64, 215
      optional :historical_creative_quality_score, :enum, 80, "google.ads.googleads.v8.enums.QualityScoreBucketEnum.QualityScoreBucket"
      optional :historical_landing_page_quality_score, :enum, 81, "google.ads.googleads.v8.enums.QualityScoreBucketEnum.QualityScoreBucket"
      proto3_optional :historical_quality_score, :int64, 216
      optional :historical_search_predicted_ctr, :enum, 83, "google.ads.googleads.v8.enums.QualityScoreBucketEnum.QualityScoreBucket"
      proto3_optional :gmail_forwards, :int64, 217
      proto3_optional :gmail_saves, :int64, 218
      proto3_optional :gmail_secondary_clicks, :int64, 219
      proto3_optional :impressions_from_store_reach, :int64, 220
      proto3_optional :impressions, :int64, 221
      proto3_optional :interaction_rate, :double, 222
      proto3_optional :interactions, :int64, 223
      repeated :interaction_event_types, :enum, 100, "google.ads.googleads.v8.enums.InteractionEventTypeEnum.InteractionEventType"
      proto3_optional :invalid_click_rate, :double, 224
      proto3_optional :invalid_clicks, :int64, 225
      proto3_optional :message_chats, :int64, 226
      proto3_optional :message_impressions, :int64, 227
      proto3_optional :message_chat_rate, :double, 228
      proto3_optional :mobile_friendly_clicks_percentage, :double, 229
      proto3_optional :organic_clicks, :int64, 230
      proto3_optional :organic_clicks_per_query, :double, 231
      proto3_optional :organic_impressions, :int64, 232
      proto3_optional :organic_impressions_per_query, :double, 233
      proto3_optional :organic_queries, :int64, 234
      proto3_optional :percent_new_visitors, :double, 235
      proto3_optional :phone_calls, :int64, 236
      proto3_optional :phone_impressions, :int64, 237
      proto3_optional :phone_through_rate, :double, 238
      proto3_optional :relative_ctr, :double, 239
      proto3_optional :search_absolute_top_impression_share, :double, 136
      proto3_optional :search_budget_lost_absolute_top_impression_share, :double, 137
      proto3_optional :search_budget_lost_impression_share, :double, 138
      proto3_optional :search_budget_lost_top_impression_share, :double, 139
      proto3_optional :search_click_share, :double, 140
      proto3_optional :search_exact_match_impression_share, :double, 141
      proto3_optional :search_impression_share, :double, 142
      proto3_optional :search_rank_lost_absolute_top_impression_share, :double, 143
      proto3_optional :search_rank_lost_impression_share, :double, 144
      proto3_optional :search_rank_lost_top_impression_share, :double, 145
      proto3_optional :search_top_impression_share, :double, 146
      proto3_optional :speed_score, :int64, 147
      proto3_optional :top_impression_percentage, :double, 148
      proto3_optional :valid_accelerated_mobile_pages_clicks_percentage, :double, 149
      proto3_optional :value_per_all_conversions, :double, 150
      proto3_optional :value_per_all_conversions_by_conversion_date, :double, 244
      proto3_optional :value_per_conversion, :double, 151
      proto3_optional :value_per_conversions_by_conversion_date, :double, 245
      proto3_optional :value_per_current_model_attributed_conversion, :double, 152
      proto3_optional :video_quartile_p100_rate, :double, 132
      proto3_optional :video_quartile_p25_rate, :double, 133
      proto3_optional :video_quartile_p50_rate, :double, 134
      proto3_optional :video_quartile_p75_rate, :double, 135
      proto3_optional :video_view_rate, :double, 153
      proto3_optional :video_views, :int64, 154
      proto3_optional :view_through_conversions, :int64, 155
      optional :sk_ad_network_conversions, :int64, 246
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Common
          Metrics = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.common.Metrics").msgclass
        end
      end
    end
  end
end
