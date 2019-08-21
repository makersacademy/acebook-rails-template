import React, { Component } from 'react'

export class PostItem extends Component {
  render() {
    return (
      <div>
       <h1>{this.props.post.message}</h1>
       <h1>{this.props.post.username}</h1>
      </div>
    )
  }
}

export default PostItem

// <%= form_for @post do |form| %>
//   <%= form.label :message, "What's on your mind..." %>
//   <%= form.text_area :message %>

//   <%= form.submit "Submit" %>
// <% end %>

// <% @public_posts.each do |post| %>
//   <h4><%= User.find(post.user_id).username %></h4>
//   <p><%= simple_format(post.message) %>
//     <sub>Posted on: <%= post.created_at.strftime("%d-%m-%Y") %></sub></p>
//     <% if session[:user_id] == post.user_id %>
//       <%= link_to 'Edit', edit_post_path(post) %>
//       <%= link_to "Delete", post, method: :delete,
//                                        data: { confirm: "You sure?" } %>
//     <%end%>
// <% end %>

{/* <h3>{this.props.data.user_id}</h3><br></br>
<p>{this.props.data.message}</p>
<div className="w3-container">
<sub>{this.props.data.created_at}</sub>
</div> */}
