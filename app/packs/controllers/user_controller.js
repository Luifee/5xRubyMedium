import { Controller } from "stimulus"
import axios from "axios"

export default class extends Controller {
  static targets = [ "followButton", "clip" ]

  follow(event) {
    event.preventDefault()
    let user = this.followButtonTarget.dataset.user
    let button = this.followButtonTarget
    axios.post(`/api/users/${user}/follow`)
      .then(function(response) {
        let status = response.data.status
        switch (status) {
          case 'sign_in_first':
            alert('請先登入')
            break;
          default:
            button.innerHTML = status
	    break;
        }
      })
      .catch(function(error) {
        console.log(error);
      })
  }


  clip(event) {
    event.preventDefault()
    let link = event.currentTarget
    let slug = link.dataset.slug
    let icon = this.clipTarget
    axios.post(`/api/memos/${slug}/clip`)
      .then(function(response) {
        switch (response.data.status) {
          case 'sign_in_first':
            alert('請先登入')
            break
          case 'Clip':
            icon.classList.add('far')
            icon.classList.remove('fas')
            break
          case 'Clipped':
            icon.classList.add('fas')
            icon.classList.remove('far')
            break
        }
      })
      .catch(function(error) {
        console.error(error);
      })
  }

}

