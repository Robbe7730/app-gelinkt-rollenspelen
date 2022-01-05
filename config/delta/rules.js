export default [
  {
    match: {},
    callback: {
      url: "http://sentence/.mu/delta", method: "POST"
    },
    options: {
      resourceFormat: "v0.0.1",
      gracePeriod: 1000,
      ignoreFromSelf: true
    }
  },
  {
    match: {},
    callback: {
      url: "http://constituency_tree/.mu/delta", method: "POST"
    },
    options: {
      resourceFormat: "v0.0.1",
      gracePeriod: 1000,
      ignoreFromSelf: true
    }
  }
]
