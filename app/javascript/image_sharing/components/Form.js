import React from 'react';

export default class Form extends React.Component {
  constructor(props) {
    super(props);
    this.state = { name: '', comment: '', message: '' };
  }

  nameInputHandler = (e) => {
    this.setState({
      name: e.target.value
    });
  };

  commentInputHandler = (e) => {
    this.setState({
      comment: e.target.value
    });
  };

  render() {
    return (
      <form onSubmit={(e) => {
        e.preventDefault();
      }}
      >
        <div id="message">
          {this.state.message}
        </div>
        <div>
          <label htmlFor="name_input">
            Your Name:
            <input
              type="text"
              name="name"
              id="name_input"
              value={this.state.name}
              onChange={this.nameInputHandler}
            />
          </label>
        </div>

        <div>
          <label htmlFor="comments_input">
            Comments:
            <input
              type="text"
              name="comments"
              id="comments_input"
              value={this.state.comment}
              onChange={this.commentInputHandler}
            />
          </label>
        </div>

        <input type="submit" value="Submit" />
      </form>
    );
  }
}
