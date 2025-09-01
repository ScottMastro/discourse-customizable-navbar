import Component from "@glimmer/component";
import { service } from "@ember/service";
import gt from "discourse/helpers/gt";

export default class CustomizableNavbar extends Component {
  static shouldRender(args) {
    return (
      settings.navbar_name?.trim()?.length > 0 &&
      settings.navbar_location?.trim()?.length > 0
    );
  }

  @service currentUser;
  @service topicTrackingState;
  @service pmTopicTrackingState;

  get names() {
    return settings.navbar_name.split("|");
  }

  get urls() {
    return settings.navbar_location.split("|");
  }

  get isAdmin() {
    return this.currentUser?.admin;
  }

  get items() {
    let names = [...this.names];
    let urls = [...this.urls];
    let currentUser = this.currentUser;

    if (!currentUser) {
      if (!settings.show_when_anon) {
        return [];
      }
      return [
        { name: "about", url: "/about", notif: 0 },
        { name: "rules", url: "/rules", notif: 0 },
        { name: "login", url: "/login", notif: 0 },
      ];
    }

    return names
      .map((name, i) => {
        let url = urls[i];
        let notif = 0;

        if (currentUser) {
          if (url.includes("/admin") && !this.isAdmin) {
            return null;
          }
          if (url.endsWith("/new")) {
            notif = this.topicTrackingState.countNew();
          }
          if (url.endsWith("/unread")) {
            notif = this.topicTrackingState.countUnread();
          }
          if (url.endsWith("/messages")) {
            // unread PM conversations
            const unread = this.pmTopicTrackingState.lookupCount("unread", {
              inboxFilter: "user",
            });

            // completely new PM conversations
            const fresh = this.pmTopicTrackingState.lookupCount("new", {
              inboxFilter: "user",
            });
            notif = unread + fresh;
          }
        }

        return { name, url, notif };
      })
      .filter(Boolean);
  }

  <template>
    <ul id="customizable-navbar">
      {{#each this.items as |item|}}
        <li>
          <a href={{item.url}} class="customizable-navbar-button">
            {{item.name}}
          </a>
          {{#if (gt item.notif 0)}}
            <div class="notification-bubble">{{item.notif}}</div>
          {{/if}}
        </li>
      {{/each}}
    </ul>
  </template>
}
