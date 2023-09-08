//
//  Model.swift
//  Generic API Layer
//
//  Created by iOS Developer on 08/09/23.
//

import Foundation

// MARK: - ResponseModel
struct ResponseModel: Codable {
    let statusCode: Int?
    let success: Success?
    let image: CardImage?
    let statusTxt: String?

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case success, image
        case statusTxt = "status_txt"
    }
}

// MARK: - CardImage
struct CardImage: Codable {
    let name, imageExtension: String?
    let width, height, size, time: Int?
    let expiration, adult, status, cloud: Int?
    let vision, likes: Int?
    let description, originalExifdata: String?
    let originalFilename: String?
    let viewsHTML, viewsHotlink, accessHTML, accessHotlink: Int?
    let file: File?
    let isAnimated, nsfw: Int?
    let idEncoded: String?
    let ratio: Double?
    let sizeFormatted, filename: String?
    let url: String?
    let urlShort: String?
    let urlSEO: String?
    let urlViewer, urlViewerPreview, urlViewerThumb: String?
    let image, thumb, medium: MediumClass?
    let displayURL: String?
    let displayWidth, displayHeight: Int?
    let viewsLabel, likesLabel, howLongAgo, dateFixedPeer: String?
    let title, titleTruncated, titleTruncatedHTML: String?
    let isUseLoader: Bool?

    enum CodingKeys: String, CodingKey {
        case name
        case imageExtension = "extension"
        case width, height, size, time, expiration, adult, status, cloud, vision, likes, description
        case originalExifdata = "original_exifdata"
        case originalFilename = "original_filename"
        case viewsHTML = "views_html"
        case viewsHotlink = "views_hotlink"
        case accessHTML = "access_html"
        case accessHotlink = "access_hotlink"
        case file
        case isAnimated = "is_animated"
        case nsfw
        case idEncoded = "id_encoded"
        case ratio
        case sizeFormatted = "size_formatted"
        case filename, url
        case urlShort = "url_short"
        case urlSEO = "url_seo"
        case urlViewer = "url_viewer"
        case urlViewerPreview = "url_viewer_preview"
        case urlViewerThumb = "url_viewer_thumb"
        case image, thumb, medium
        case displayURL = "display_url"
        case displayWidth = "display_width"
        case displayHeight = "display_height"
        case viewsLabel = "views_label"
        case likesLabel = "likes_label"
        case howLongAgo = "how_long_ago"
        case dateFixedPeer = "date_fixed_peer"
        case title
        case titleTruncated = "title_truncated"
        case titleTruncatedHTML = "title_truncated_html"
        case isUseLoader = "is_use_loader"
    }
}

// MARK: - File
struct File: Codable {
    let resource: Resource?
}

// MARK: - Resource
struct Resource: Codable {
    let chain, chainCode: Chain?

    enum CodingKeys: String, CodingKey {
        case chain
        case chainCode = "chain_code"
    }
}

// MARK: - Chain
struct Chain: Codable {
    let image, thumb, medium: String?
}

// MARK: - MediumClass
struct MediumClass: Codable {
    let filename, name, mime, imageExtension: String?
    let url: String?
    let size: Int?

    enum CodingKeys: String, CodingKey {
        case filename, name, mime
        case imageExtension = "extension"
        case url, size
    }
}

// MARK: - Success
struct Success: Codable {
    let message: String?
    let code: Int?
}
