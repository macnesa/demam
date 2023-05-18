# Demam App

Demam App

## Daftar Isi

- [Instalasi](#instalasi)
- [Endpoint](#endpoint)
  - [Contoh](#contoh)
- [Format Respons](#format-respons)
- [Endpoint Spesifik](#endpoint-spesifik)

## Instalasi

Instruksi instalasi proyek.

## Endpoint

Berikut adalah daftar endpoint yang tersedia dalam API.

### Contoh

**Request**

GET /example

**Response**

```json
{
  "status": {
    "code": 200,
    "response": "success",
    "messages": "Data available"
  },
  "result": {
    "id": 1,
    "name": "John Doe"
  }
}
```

## Format Respons

Berikut adalah format respons yang digunakan dalam API.

- `status`: Menyimpan informasi status respons.
  - `code`: Kode status HTTP.
  - `response`: Status respons ("success" atau "failed").
  - `messages`: Pesan terkait respons.
- `result`: Menyimpan hasil dari operasi API.

## Endpoint Spesifik

### GET /patients

Mengambil daftar pasien.

**Response**
```json 
{
  "status": {
    "code": 200,
    "response": "success",
    "messages": "Data available"
  },
  "result": [
    {
      "id": 1,
      "name": "John Doe",
      "image_url": "http://example.com/image.jpg"
    },
    {
      "id": 2,
      "name": "Jane Smith",
      "image_url": "http://example.com/image.jpg"
    }
  ]
}
```

### GET /patients/{id}

Mengambil detail pasien berdasarkan ID.

**Parameter Path:**

- `id` (integer): ID pasien.

**Response**
```json
{
  "status": {
    "code": 200,
    "response": "success",
    "messages": "Data available"
  },
  "result": {
    "id": 1,
    "name": "John Doe",
    "image_url": "http://example.com/image.jpg"
  }
}
```

### POST /patients

Membuat pasien baru.

**Request Body**
```json
{
  "name": "John Doe",
  "sex": "male",
  "religion": "Christian",
  "phone": "1234567890",
  "address": "123 Main St",
  "nik": "1234567890123456",
  "image_url": "http://example.com/image.jpg"
}
```

**Response**
```json
{
  "status": {
    "code": 201,
    "response": "success",
    "messages": "Patient Added"
  },
  "result": {
    "id": 1,
    "name": "John Doe",
    "image_url": "http://example.com/image.jpg"
  }
}
```